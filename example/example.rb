require 'weibo_2'

%w(rubygems bundler).each { |dependency| require dependency }
Bundler.setup
%w(sinatra haml sass).each { |dependency| require dependency }
enable :sessions

client = WeiboOAuth2::Client.new('1317413087', '79c39d8c66a93bd15f16ed0e999532f9')

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
  
  url = client.authorize_url(:redirect_uri => 'http://127.0.0.1:4567/callback')
  redirect url
end

get '/callback' do
  access_token = client.auth_code.get_token(params[:code].to_s, :redirect_uri => 'http://127.0.0.1:4567/callback')
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