Note: I got a lot of inspiration from [this gem](https://github.com/ballantyne/weibo) and [this gem](https://github.com/acenqiu/weibo2). The first one will soon be deprecated since weibo is planning to switch to oauth2. The second one has not been fully implemented and is still lacking some features (but a nice try nevertheless). Thanks Scott and acenqiu.

# WeiboOAuth2

WeioOAuth2 is a Ruby gem that provides a wrapper for interacting with sina weibo's v2 [API](http://open.weibo.com/wiki/API%E6%96%87%E6%A1%A3_V2), which is currently the latest version. Check out the link if you are interested in browsing the details. The output data format is Hashie::Mash, check out [here](https://github.com/intridea/hashie#mash). If you are not familiar with oauth2, I recommend that you read this [article](http://open.weibo.com/wiki/%E6%8E%88%E6%9D%83%E6%9C%BA%E5%88%B6%E8%AF%B4%E6%98%8E).

## Requirements

1.  weibo account
2.  weibo app API key
3.  weibo app API secret

## Installation
        
I call it weibo_2 because someone else took the name weibo_oauth2.

```bash
$ gem install weibo_2
```

## Basic Usage

The example have been moved to [here](https://github.com/simsicon/weibo_2_example). It wiil be more convenient to update.

The [example](https://github.com/simsicon/weibo_2_example) written with sinatra shows how to ask for oauth2 permission, get the token and send status with picture. It should cover basic usage in all ruby apps. You can run your own demo!

```bash
$ KEY=change_this_to_your_key SECRET=change_this_to_your_secret REDIR_URI=change_this_to_your_redir_uri ruby example.rb
```
It should work.


1.  How to get the token?

    OAuth2 is simpler than its first version. In order to get the access token, you first need to get an Authorization Code through a callback request. Now use the following code to get the token.

    ```ruby
    WeiboOAuth2::Config.api_key = YOUR_KEY
    WeiboOAuth2::Config.api_secret = YOUR_SECRET
    WeiboOAuth2::Config.redirect_uri = YOUR_CALLBACK_URL   
    ```

    If you are developing in your localhost, you can set YOUR_CALLBACK_URL as 'http://127.0.0.1/callback' something. Then set your weibo app account's callback URL as this URL too. Weibo will call the URL using GET method, which will then enable you to retrieve the authorization code.
    
    ```ruby
    client = WeiboOAuth2::Client.new  
    ```
    
    Or you can pass the key and secret to new a client if you did not set WeiboOAuth2::Config
    
    Redirect to this URL. If user grants you permission, then you will get the authorization code.
    
    ```ruby
    client.authorize_url
    ```
    
    In your callback handling method, you should add something like the following, 
    
    ```ruby
    client.auth_code.get_token(params[:code])
    ```
    
    which will give permission to your client.
    
2.  How to post a status with picture? (or call other interfaces)
    
    Simply update a status
        
    ```ruby
    client.statuses.update(params[:status])
    ```
    
    Upload a picture.
        
    ```ruby
    pic = params[:file].delete(:tempfile)
    client.statuses.upload(params[:status], pic, params[:file])
    ```

    pass params[:file] into upload method as options could help weibo_2 to build post body, useful options as:
    *   filename, filename with extension of the uploading file, example 'pic.jpg'
    *   type, mime type of the uploading file, example 'image/jpeg'
## Setting up SSL certificates
    
    This gem using [faraday](https://github.com/technoweenie/faraday) for connection, which supports ssl. According to [this article](https://github.com/technoweenie/faraday/wiki/Setting-up-SSL-certificates), you can do as following to support ssl connection.

    ### Ubuntu

    To locate your SSL certificate folder, type `openssl version -a`. Append `/certs` to the OPENSSLDIR listed, here it would be `/usr/lib/ssl/certs`.

    ```ruby
        client = WeiboOAuth2::Client.new(YOUR_KEY, YOUR_SECRET, :ssl => {:ca_path => "/usr/lib/ssl/certs"})
        # or as below if you have set WeiboOAuth2::Config.api_key and WeiboOAuth2::Config.api_secret already
        # client = WeiboOAuth2::Client.new('', '', :ssl => {:ca_path => "/usr/lib/ssl/certs"})
    ```

    ### On Heroku, Fedora, CentOS

    ```ruby
        client = WeiboOAuth2::Client.new(YOUR_KEY, YOUR_SECRET, :ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'})
        # or as below if you have set WeiboOAuth2::Config.api_key and WeiboOAuth2::Config.api_secret already
        # client = WeiboOAuth2::Client.new('', '', :ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'})
    ```

    For Fedora and CentOS, use the path and file `/etc/pki/tls/certs/ca-bundle.crt` instead, or find your system path with `openssl version -a`.

## Integrate with Devise and omniauth

1. Install gems in Gemfile
   
   ```ruby
   	 gem 'devise'
   	 gem 'omniauth'
	 gem 'omniauth-weibo-oauth2'
	 gem 'weibo_2'
   ```


2. In devise initailize file config/initiallizers/devise.rb, add a line into setup block, please replace key and secret with yours.

   ```ruby
     config.omniauth :weibo, 'key', 'secret', :scope => 'user,public_repo'
   ```
        
3. Then you should handle omini callback controller by yourself, there is sample project show how to integrate devise and omniauth you can follow [devise-omniauth-example](https://github.com/holden/devise-omniauth-example) 

4. After get the callback data, you will see `env['omniauth.auth']['credentials']` has the value `token` and `expires_at`, store them into session or record,now you can use WeiboOAuth2 in anywhere:

   ```ruby
     client = WeiboOAuth2::Client.new
     client.get_token_from_hash({:access_token=>session[:token],:expires_at=>session[:expires_at]})
     statuses = client.statuses
     statuses.update('just test from my app')
   ```
