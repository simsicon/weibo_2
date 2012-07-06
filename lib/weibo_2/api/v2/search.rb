module WeiboOAuth2
  module Api
    module V2
      class Search < Base
        
        #read interfaces
        def suggestions_users(q, opt={})
          hashie get("search/suggestions/users.json", :params => {:q => CGI::escape(q)}.merge(opt))
        end
        
        def suggestions_statuses(q, opt={})
          hashie get("search/suggestions/statuses.json", :params => {:q => CGI::escape(q)}.merge(opt))
        end
        
        def suggestions_schools(q, opt={})
          hashie get("search/suggestions/schools.json", :params => {:q => CGI::escape(q)}.merge(opt))
        end
        
        def suggestions_companies(q, opt={})
          hashie get("search/suggestions/companies.json", :params => {:q => CGI::escape(q)}.merge(opt))
        end
        
        def suggestions_apps(q, opt={})
          hashie get("search/suggestions/apps.json", :params => {:q => CGI::escape(q)}.merge(opt))
        end
        
        def suggestions_at_users(q, type, opt={})
          hashie get("search/suggestions/at_users.json", :params => {:q => CGI::escape(q), :type => type}.merge(opt))
        end
        
        def topics(q, opt={})
          hashie get("search/topics.json", :params => {:q => CGI::escape(q)}.merge(opt))
        end
        
      end
    end
  end
end