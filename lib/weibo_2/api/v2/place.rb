module WeiboOAuth2
  module Api
    module V2
      class Place < Base
        #read interfaces
        def public_timeline(opt={})
          hashie get("place/public_timeline.json", :params => opt)
        end
        
        def friends_timeline(opt={})
          hashie get("place/friends_timeline.json", :params => opt)
        end
        
        def user_timeline(uid, opt={})
          hashie get("place/user_timeline.json", :params => {:uid => uid}.merge(opt))
        end
        
        def poi_timeline(poiid, opt={})
          hashie get("place/poi_timeline.json", :params => {:poiid => poiid}.merge(opt))
        end
        
        def nearby_timeline(lat, long, opt={})
          hashie get("place/nearby_timeline.json", :params => {:lat => lat, :long => long}.merge(opt))
        end
        
        def statuses_show(id, opt={})
          hashie get("place/statuses/show.json", :params => {:id => id}.merge(opt))
        end
        
        def users_show(uid, opt={})
          hashie get("place/users/show.json", :params => {:uid => uid}.merge(opt))
        end
        
        def users_checkins(uid, opt={})
          hashie get("place/users/checkins.json", :params => {:uid => uid}.merge(opt))
        end
        
        def users_photos(uid, opt={})
          hashie get("place/users/photos.json", :params => {:uid => uid}.merge(opt))
        end
        
        def users_tips(uid, opt={})
          hashie get("place/users/tips.json", :params => {:uid => uid}.merge(opt))
        end
        
        def users_todos(uid, opt={})
          hashie get("place/users/todos.json", :params => {:uid => uid}.merge(opt))
        end
        
        def pois_show(poiid, opt={})
          hashie get("place/pois/show.json", :params => {:poiid => poiid}.merge(opt))
        end
        
        def pois_users(poiid, opt={})
          hashie get("place/pois/users.json", :params => {:poiid => poiid}.merge(opt))
        end
        
        def pois_tips(poiid, opt={})
          hashie get("place/pois/tips.json", :params => {:poiid => poiid}.merge(opt))
        end
        
        def pois_photos(poiid, opt={})
          hashie get("place/pois/photos.json", :params => {:poiid => poiid}.merge(opt))
        end
        
        def pois_search(keyword, opt={})
          hashie get("place/pois/search.json", :params => {:keyword => keyword}.merge(opt))
        end
        
        def pois_category(opt={})
          hashie get("place/pois/category.json", :params => opt)
        end
        
        def nearby_pois(lat, long, opt={})
          hashie get("place/nearby/pois.json", :params => {:lat => lat, :long => long}.merge(opt))
        end
        
        def nearby_users(lat, long, opt={})
          hashie get("place/nearby/users.json", :params => {:lat => lat, :long => long}.merge(opt))
        end
        
        def nearby_photos(lat, long, opt={})
          hashie get("place/nearby/photos.json", :params => {:lat => lat, :long => long}.merge(opt))
        end
        
        def nearby_users_list(lat, long, opt={})
          hashie get("place/nearby_users/list.json", :params => {:lat => lat, :long => long}.merge(opt))
        end
        
        
        #write interfaces
        def pois_create(title, lat, long, city, opt={})
          hashie post("place/pois/create.json", :params => {:title => title, :lat => lat, :long => long, :city => city}.merge(opt))
        end
        
        def pois_add_checkin(poiid, status, opt={})
          hashie post("place/pois/add_checkin.json", :params => {:poiid => poiid, :status => status}.merge(opt))
        end
        
        def pois_add_photo(poiid, status, pic, opt={})
          multipart = Base.build_multipart_bodies({"poiid" => poiid, "status" => status, "pic" => pic}.merge(opt))
          hashie post("place/pois/add_photo.json", :headers => multipart[:headers], :body => multipart[:body])
        end
        
        def pois_add_tip(poiid, status, opt={})
          hashie post("place/pois/add_tip.json", :params => {:poiid => poiid, :status => status}.merge(opt))
        end
        
        def pois_add_todo(poiid, status, opt={})
          hashie post("place/pois/create.json", :params => {:poiid => poiid, :status => status}.merge(opt))
        end
        
        def nearby_users_create(lat, long, opt={})
          hashie post("place/nearby_users/create.json", :params => {:lat => lat, :long => long}.merge(opt))
        end
        
        def nearby_users_destroy(opt={})
          hashie post("place/nearby_users/destroy.json", :params => opt)
        end
      end
    end
  end
end