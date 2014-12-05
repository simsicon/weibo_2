require "weibo_2/version"
require "weibo_2/config"
require "weibo_2/base"
require "weibo_2/client"
require "weibo_2/errors"
require "weibo_2/access_token"
require "weibo_2/api/v2/base"
require "weibo_2/api/v2/statuses"
require "weibo_2/api/v2/users"
require "weibo_2/api/v2/comments"
require "weibo_2/api/v2/friendships"
require "weibo_2/api/v2/account"
require "weibo_2/api/v2/favorites"
require "weibo_2/api/v2/trends"
require "weibo_2/api/v2/tags"
require "weibo_2/api/v2/register"
require "weibo_2/api/v2/search"
require "weibo_2/api/v2/short_url"
require "weibo_2/api/v2/suggestions"
require "weibo_2/api/v2/remind"
require "weibo_2/api/v2/place"
require "weibo_2/api/v2/location"
require "weibo_2/strategy/auth_code"


if defined?(Rails)
  module WeiboOAuth2
    class Railtie < Rails::Railtie
      initializer "weibo_oauth2" do
        ActiveSupport.on_load :action_controller do
          if Object.const_defined?("Devise") && Devise.omniauth_configs[:weibo]
            WeiboOAuth2::Config.api_key = Devise.omniauth_configs[:weibo].args[0]
            WeiboOAuth2::Config.api_secret = Devise.omniauth_configs[:weibo].args[1]
          end
        end
      end
    end
  end
end
