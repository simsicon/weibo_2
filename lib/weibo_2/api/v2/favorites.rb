module WeiboOAuth2
  module Api
    module V2
      class Favorites < Base
      
        #read interfaces
        def favorites(opt={})
          hashie get("favorites.json", :params => opt)
        end
        
        def ids(opt={})
          hashie get("favorites/ids.json", :params => opt)
        end
        
        def show(id, opt={})
          hashie get("favorites/show.json", :params => {:id => id}.merge(opt))
        end
        
        def by_tags(tid, opt={})
          hashie get("favorites/by_tags.json", :params => {:tid => tid}.merge(opt))
        end
        
        def tags(opt={})
          hashie get("favorites/tags.json", :params => opt)
        end
        
        def by_tags_ids(tid, opt={})
          hashie get("favorites/by_tags/ids.json", :params => {:tid => tid}.merge(opt))
        end
        
        #write interfaces
        def create(id, opt={})
          hashie post("favorites/create.json", :params => {:id => id}.merge(opt))
        end
        
        def destroy(id, opt={})
          hashie post("favorites/destroy.json", :params => {:id => id}.merge(opt))
        end
        
        def destroy_batch(ids, opt={})
          hashie post("favorites/destroy_batch.json", :params => {:ids => ids}.merge(opt))
        end
        
        def tags_update(id, tags, opt={})
          hashie post("favorites/tags/update.json", :params => {:id => id, :tags => CGI::escape(tags)}.merge(opt))
        end
        
        def tags_update_batch(tid, tag, opt={})
          hashie post("favorites/tags/update_batch.json", :params => {:tid => tid, :tag => CGI::escape(tag)}.merge(opt))
        end
        
        def tags_destroy_batch(tid, opt={})
          hashie post("favorites/tags/destroy_batch.json", :params => {:tid => tid}.merge(opt))
        end
        
      end
    end
  end
end