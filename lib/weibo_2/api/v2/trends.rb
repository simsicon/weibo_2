module WeiboOAuth2
  module Api
    module V2
      class Trends < Base
        
        #read interfaces
        def trends(uid, opt={})
          hashie get("trends.json", :params => {:uid => uid}.merge(opt))
        end
        
        def is_follow(trend_name, opt={})
          hashie get("trends/is_follow.json", :params => {:trend_name => CGI::escape(trend_name)}.merge(opt))
        end
        
        def hourly(opt={})
          hashie get("trends/hourly.json", :params => opt)
        end
        
        def daily(opt={})
          hashie get("trends/daily.json", :params => opt)
        end
        
        def weekly(opt={})
          hashie get("trends/weekly.json", :params => opt)
        end
        
        #write interfaces
        def follow(trend_name, opt={})
          hashie post("trends/follow.json", :params => {:trend_name => trend_name}.merge(opt))
        end
        
        def destroy(trend_id, opt={})
          hashie post("trends/destroy.json", :params => {:trend_id => trend_id}.merge(opt))
        end
        
      end
    end
  end
end