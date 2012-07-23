require 'oauth2'

module WeiboOAuth2
  class Client < OAuth2::Client
 
    def initialize(client_id='', client_secret='', opts={}, &block)
      client_id = WeiboOAuth2::Config.api_key if client_id.empty?
      client_secret = WeiboOAuth2::Config.api_secret if client_secret.empty?
      super
      @site = "https://api.weibo.com/2/"
      @options[:authorize_url] = '/oauth2/authorize'
      @options[:token_url] = '/oauth2/access_token'
    end
    
    def authorize_url(params={})
      params[:client_id] = @id unless params[:client_id]
      params[:response_type] = 'code' unless params[:response_type]
      params[:redirect_uri] = WeiboOAuth2::Config.redirect_uri unless params[:redirect_uri]
      super
    end
    
    def get_token(params, access_token_opts={})
      params = params.merge({:parse => :json})
      access_token_opts = access_token_opts.merge({:header_format => "OAuth2 %s", :param_name => "access_token"})
      super
    end
    
    def get_and_restore_token(params, access_token_opts={})
      @access_token = get_token(params, access_token_opts={})
    end
    
    def get_token_from_hash(hash)
      access_token = hash.delete(:access_token) || hash.delete('access_token')
      opts = {:expires_at => (hash.delete(:expires_at) || hash.delete('expires_at')),
              :header_format => "OAuth2 %s",
              :param_name => "access_token"}

      @access_token = WeiboOAuth2::AccessToken.new(self, access_token, opts)
    end
    
    def authorized?
      !!@access_token
    end
    
    def users
      @users ||= WeiboOAuth2::Api::V2::Users.new(@access_token) if @access_token
    end
    
    def statuses
      @statues ||= WeiboOAuth2::Api::V2::Statuses.new(@access_token) if @access_token
    end
    
    def comments
      @comments ||= WeiboOAuth2::Api::V2::Comments.new(@access_token) if @access_token
    end
    
    def friendships
      @friendships ||= WeiboOAuth2::Api::V2::Friendships.new(@access_token) if @access_token
    end
    
    def account
      @account ||= WeiboOAuth2::Api::V2::Account.new(@access_token) if @access_token      
    end
    
    def favorites
      @favorites ||= WeiboOAuth2::Api::V2::Favorites.new(@access_token) if @access_token      
    end
    
    def trends
      @trends ||= WeiboOAuth2::Api::V2::Trends.new(@access_token) if @access_token      
    end
    
    def tags
      @tags ||= WeiboOAuth2::Api::V2::Tags.new(@access_token) if @access_token      
    end
    
    def register
      @register ||= WeiboOAuth2::Api::V2::Register.new(@access_token) if @access_token      
    end
    
    def search
      @search ||= WeiboOAuth2::Api::V2::Search.new(@access_token) if @access_token      
    end
    
    def short_url
      @short_url ||= WeiboOAuth2::Api::V2::ShortUrl.new(@access_token) if @access_token      
    end
    
    def suggestions
      @suggestions ||= WeiboOAuth2::Api::V2::Suggestions.new(@access_token) if @access_token      
    end
    
    def remind
      @remind ||= WeiboOAuth2::Api::V2::Remind.new(@access_token) if @access_token      
    end
    
    def auth_code
      @auth_code ||= WeiboOAuth2::Strategy::AuthCode.new(self)
    end
    
  end 
end