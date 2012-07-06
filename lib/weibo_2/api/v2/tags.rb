module WeiboOAuth2
  module Api
    module V2
      class Tags < Base
        
        #read interfaces
        def tags(uid, opt={})
          hashie get("tags.json", :params => {:uid => uid}.merge(opt))
        end
        
        def tags_batch(uids, opt={})
          hashie get("tags/tags_batch.json", :params => {:uids => uids}.merge(opt))
        end
        
        def suggestions(opt={})
          hashie get("tags/suggestions.json", :params => opt)
        end
       
        
        #write interfaces
        def create(tags, opt={})
          hashie post("tags/create.json", :params => {:tags => tags}.merge(opt))
        end
        
        def destroy(tag_id, opt={})
          hashie post("tags/destroy.json", :params => {:tag_id => tag_id}.merge(opt))
        end
        
        def destroy_batch(ids, opt={})
          hashie post("tags/destroy_batch.json", :params => {:ids => ids}.merge(opt))
        end
        
      end
    end
  end
end