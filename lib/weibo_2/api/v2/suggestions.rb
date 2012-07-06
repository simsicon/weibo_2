module WeiboOAuth2
  module Api
    module V2
      class Suggestions < Base
        
        #read interfaces
        def users_hot(opt={})
          hashie get("suggestions/users/hot.json", :params => opt)
        end
        
        def users_may_interested(opt={})
          hashie get("suggestions/users/may_interested.json", :params => opt)
        end
        
        def users_by_status(content, opt={})
          hashie get("suggestions/users/by_status.json", :params => {:content => CGI::escape(content)}.merge(opt))
        end
        
        #http://open.weibo.com/wiki/2/suggestions/statuses/hot
        def statuses_hot(type, is_pic, opt={})
          hashie get("suggestions/statuses/hot.json", :params => {:type => type, :is_pic => is_pic}.merge(opt))
        end
        
        #http://open.weibo.com/wiki/2/suggestions/statuses/reorder
        def statuses_reorder(section, opt={})
          hashie get("suggestions/statuses/reorder.json", :params => {:section => section}.merge(opt))
        end
        
        def statuses_reorder_ids(section, opt={})
          hashie get("suggestions/statuses/reorder/ids.json", :params => {:section => section}.merge(opt))
        end
        
        def favorites_hot(opt={})
          hashie get("suggestions/favorites/hot.json", :params => opt)
        end
        
        #write interfaces
        def users_not_interested(uid, opt={})
          hashie post("suggestions/users/not_interested.json", :params => {:uid => uid}.merge(opt))
        end
        
      end
    end
  end
end