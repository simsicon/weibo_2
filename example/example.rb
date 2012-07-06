require 'weibo_2'
require 'time-ago-in-words'

%w(rubygems bundler).each { |dependency| require dependency }
Bundler.setup
%w(sinatra haml sass).each { |dependency| require dependency }
enable :sessions

WeiboOAuth2::Config.api_key = ENV['KEY']
WeiboOAuth2::Config.api_secret = ENV['SECRET']
WeiboOAuth2::Config.redirect_uri = ENV['REDIR_URI']

client = WeiboOAuth2::Client.new

get '/' do
  puts WeiboOAuth2::Config.redirect_uri
  if session[:access_token] && !client.authorized?
    client.get_token_from_hash({:access_token => session[:access_token], :expires_at => session[:expires_at]}) 
  end
  if session[:uid]
    @user = client.users.show_by_uid(session[:uid]) 
    @statuses = client.statuses
  end
  haml :index
end

get '/connect' do
  redirect client.authorize_url
end

get '/callback' do
  access_token = client.auth_code.get_token(params[:code].to_s)
  session[:uid] = access_token.params["uid"]
  session[:access_token] = access_token.token
  session[:expires_at] = access_token.expires_at
  @user = client.users.show_by_uid(session[:uid].to_i)
  redirect '/'
end

get '/logout' do
  session[:uid] = nil
  session[:access_token] = nil
  session[:expires_at] = nil
  redirect '/'
end 

get '/screen.css' do
  content_type 'text/css'
  sass :screen
end

post '/update' do
  statuses = client.statuses

  unless params[:file] && (tmpfile = params[:file][:tempfile]) && (name = params[:file][:filename])
    statuses.update(params[:status])
  else
    pic = File.open(tmpfile.path)
    statuses.upload(params[:status], pic)
  end

  redirect '/'
end
