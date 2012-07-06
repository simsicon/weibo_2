module WeiboOAuth2
  module Api
    module V2
      class Statuses < Base
        
        #read interfaces
        def public_timeline(opt={})
          hashie get("statuses/public_timeline.json", :params => opt)
        end
        
        def friends_timeline(opt={})
          hashie get("statuses/friends_timeline.json", :params => opt)
        end
        
        def home_timeline(opt={})
          hashie get("statuses/home_timeline.json", :params => opt)
        end
        
        def friends_timeline_ids(opt={})
          hashie get("statuses/friends_timeline/ids.json", :params => opt)
        end
        
        def user_timeline(opt={})
          hashie get("statuses/user_timeline.json", :params => opt)
        end
        
        def user_timeline_ids(opt={})
          hashie get("statuses/user_timeline/ids.json", :params => opt)
        end
        
        def repost_timeline(id, opt={})
          hashie get("statuses/repost_timeline.json", :params => {:id => id}.merge(opt))
        end
        
        def repost_timeline_ids(id, opt={})
          hashie get("statuses/repost_timeline/ids.json", :params => {:id => id}.merge(opt))
        end
        
        def repost_by_me(opt={})
          hashie get("statuses/repost_by_me.json", :params => opt)
        end
        
        def mentions(opt={})
          hashie get("statuses/mentions.json", :params => opt)
        end
        
        def mentions_ids(opt={})
          hashie get("statuses/mentions/ids.json", :params => opt)
        end
        
        def bilateral_timeline(opt={})
          hashie get("statuses/bilateral_timeline.json", :params => opt)
        end
        
        def show(opt={})
          hashie get("statuses/show.json", :params => opt)
        end
        
        def querymid(opt={})
          hashie get("statuses/querymid.json", :params => opt)
        end
        
        def queryid(opt={})
          hashie get("statuses/queryid.json", :params => opt)
        end
        
        def hot_repost_daily(opt={})
          hashie get("statuses/hot/repost_daily.json", :params => opt)
        end
        
        def hot_repost_weekly(opt={})
          hashie get("statuses/hot/repost_weekly.json", :params => opt)
        end
        
        def hot_comments_daily(opt={})
          hashie get("statuses/hot/comments_daily.json", :params => opt)
        end
        
        def hot_comments_weekly(opt={})
          hashie get("statuses/hot/comments_weekly.json", :params => opt)
        end
        
        def count(opt={})
          hashie get("statuses/count.json", :params => opt)
        end
        
        #write interfaces
        def repost(id, opt={})
          hashie post("statuses/repost.json", :params => {"id" => id}.merge(opt))
        end
        
        def destroy(id)
          hashie post("statuses/destroy.json", :params => {"id" => id})
        end
        
        def update(status, opt={})
          hashie post("statuses/update.json", :params => {"status" => status}.merge(opt))
        end
        
  
        def upload(status, pic, opt={})
          multipart = Base.build_multipart_bodies({"status" => status, "pic" => pic}.merge(opt))
          hashie post("statuses/upload.json", :headers => multipart[:headers], :body => multipart[:body])
        end
        
        def upload_url_text(opt={})
          hashie post("statuses/upload_url_text.json", :params => opt)
        end
        
        def emotions(opt={})
          hashie get("emotions.json", :params => opt)
        end
            
      end
    end
  end
end