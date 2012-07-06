require 'rest_client'

module WeiboOAuth2
  module Api
    module V2
      class Remind < Base
        
        #read interfaces
        
        #http://open.weibo.com/wiki/2/remind/unread_count
        #this interface is different, it has a different domain, and frequently changed, it should be usually called from javascript. so I removed all parameters.
        def unread_count()
          hashie RestClient.get "https://rm.api.weibo.com/2/remind/unread_count.json?access_token=#{@access_token.token}"
        end
        
        #write interfaces
        def set_count()
          hashie RestClient.post "https://rm.api.weibo.com/2/remind/set_count.json", :access_token => access_token.token
        end
      end
    end
  end
end