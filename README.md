Note: I got a lot of inspiration from [this gem](https://github.com/ballantyne/weibo) and [this gem](https://github.com/acenqiu/weibo2). The first one will soon be deprecated since weibo is planning to switch to oauth2. The second one has not been fully implemented and is still lacking some features (but a nice try nevertheless). Thanks Scott and acenqiu.

# WeiboOAuth2

WeioOAuth2 is a Ruby gem that provides a wrapper for interacting with sina weibo's v2 [API](http://open.weibo.com/wiki/API%E6%96%87%E6%A1%A3_V2), which is currently the latest version. Check out the link if you are interested in browsing the details. The output data format is Hashie::Mash, check out [here](https://github.com/intridea/hashie#mash). If you are not familiar with oauth2, I recommend that you read this [article](http://open.weibo.com/wiki/Oauth2).

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

The example written with sinatra in this directory shows how to ask for oauth2 permission, get the token and send status with picture. It should cover basic usage in all ruby apps. You can visit http://weibo-oauth2-example.herokuapp.com/ to see the demo.


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
    
    Upload a picture
        
        ```ruby
        tmpfile = params[:file][:tempfile]
        pic = File.open(tmpfile.path)
        client.statuses.upload(params[:status], pic)
        ```
        