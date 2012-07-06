module WeiboOAuth2
  module Api
    module V2
      class Register < Base
        
        #read interfaces
        def verify_nickname(nickname, opt={})
          hashie get("register/verify_nickname.json", :params => {:nickname => CGI::escape(nickname)}.merge(opt))
        end
        
      end
    end
  end
end