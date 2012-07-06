module WeiboOAuth2
  module Api
    module V2
      class Notification < Base
        #read interfaces
        def send(uids, tpl_id, opt={})
          hashie get("notification/send", :params => {:uids => uids, :tpl_id => tpl_id}.merge(opt))
        end
      end
    end
  end
end
