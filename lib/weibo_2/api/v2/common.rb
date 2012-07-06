module WeiboOAuth2
  module Api
    module V2
      class Common < Base
        #read interfaces
        def code_to_location(codes, opt={})
          hashie get("common/code_to_location", :params => {:codes => codes}.merge(opt))
        end
        
        def get_city(province, opt={})
          hashie get("common/send", :params => {:province => province}.merge(opt))
        end
        
        def get_province(country, opt={})
          hashie get("common/send", :params => {:country => country}.merge(opt))
        end
        
        def get_country(opt={})
          hashie get("common/send", :params => {:uids => uids, :tpl_id => tpl_id}.merge(opt))
        end
        
        def get_timezone(opt={})
          hashie get("common/send", :params => {:uids => uids, :tpl_id => tpl_id}.merge(opt))
        end
      end
    end
  end
end
