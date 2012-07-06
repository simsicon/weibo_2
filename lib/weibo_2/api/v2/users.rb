module WeiboOAuth2
  module Api
    module V2
      class Users < Base
              
        def show(opt={})
          hashie get("users/show.json", :params => opt)
        end
        
        def show_by_uid(uid)
          show({"uid" => uid.to_i})
        end
        
        def show_by_screen_name(screen_name)
          show({"screen_name" => screen_name})
        end
        
        def domain_show(domain, opt={})
          hashie get("users/domain_show.json", :params => {:domain => domain}.merge(opt))
        end
        
        def counts(uids, opt={})
          hashie get("users/counts.json", :params => {:uids => uids}.merge(opt))
        end
        
        
      end
    end
  end
end