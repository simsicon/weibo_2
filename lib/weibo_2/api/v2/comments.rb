module WeiboOAuth2
  module Api
    module V2
      class Comments < Base
      
        #read interfaces
        def show(id, opt={})
          hashie get("comments/show.json", :params => {:id => id}.merge(opt))
        end
        
        def by_me(opt={})
          hashie get("comments/by_me.json", :params => opt)
        end
        
        def to_me(opt={})
          hashie get("comments/to_me.json", :params => opt)
        end
        
        def timeline(opt={})
          hashie get("comments/timeline.json", :params => opt)
        end
        
        def mentions(opt={})
          hashie get("comments/mentions.json", :params => opt)
        end
        
        def show_batch(cids, opt={})
          hashie get("comments/show_batch.json", :params => {:cids => cids}.merge(opt))
        end
        
        #write interfaces
        def create(comment, id, opt={})
          hashie post("comments/create.json", :params => {:comment => comment, :id => id}.merge(opt))
        end
        
        def destroy(cid, opt={})
          hashie post("comments/destroy.json", :params => {:cid => cid}.merge(opt))
        end
        
        def destroy_batch(cids, opt={})
          hashie post("comments/destroy_batch.json", :params => {:cids => cids}.merge(opt))
        end
        
        def reply(cid, id, comment, opt={})
          hashie post("comments/reply.json", :params => {:cid => cid, :id => id, :comment => comment}.merge(opt))
        end
               
      end
    end
  end
end