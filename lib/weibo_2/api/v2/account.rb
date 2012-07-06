module WeiboOAuth2
  module Api
    module V2
      class Account < Base
      
        #read interfaces
        def get_privacy(opt={})
          hashie get("account/get_privacy.json", :params => opt)
        end
        
        def profile_school_list(opt={})
          hashie get("account/profile/school_list.json", :params => opt)
        end
        
        def rate_limit_status(opt={})
          hashie get("account/rate_limit_status.json", :params => opt)
        end
        
        def get_uid(opt={})
          hashie get("account/get_uid.json", :params => opt)
        end
        
        #write interfaces
        def end_session(opt={})
          hashie get("account/end_session.json", :params => opt)
        end
        
      end
    end
  end
end