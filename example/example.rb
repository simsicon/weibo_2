require 'weibo_2'

%w(rubygems bundler).each { |dependency| require dependency }
Bundler.setup
%w(sinatra haml sass).each { |dependency| require dependency }
enable :sessions

WeiboOAuth2::Config.api_key = ENV['KEY']
WeiboOAuth2::Config.api_secret = ENV['SECRET']
WeiboOAuth2::Config.redirect_uri = ENV['REDIR_URI']

client = WeiboOAuth2::Client.new

get '/' do
  if session[:access_token] && !client.authorized?
    client.get_token_from_hash({:access_token => session[:access_token], :expires_at => session[:expires_at]}) 
  end
  if session[:uid]
    @user = client.users.show_by_uid(session[:uid]) 
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
  puts access_token.params
  puts access_token.inspect
  puts session[:uid]
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