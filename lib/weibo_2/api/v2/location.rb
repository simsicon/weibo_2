module WeiboOAuth2
  module Api
    module V2
      class Location < Base
        
        #read interfaces
        def base_get_map_image(opt={})
          hashie get("location/base/get_map_image.json", :params => opt)
        end
        
        def geo_ip_to_geo(ip, opt={})
          hashie get("location/geo/ip_to_geo.json", :params => {:ip => ip}.merge(opt))
        end
        
        def geo_address_to_geo(address, opt={})
          hashie get("location/geo/address_to_geo.json", :params => {:address => address}.merge(opt))
        end
        
        def geo_geo_to_address(coordinate, opt={})
          hashie get("location/geo/geo_to_address.json", :params => {:coordinate => coordinate}.merge(opt))
        end
        
        def geo_gps_to_offset(coordinate, opt={})
          hashie get("location/geo/gps_to_offset.json", :params => {:coordinate => coordinate}.merge(opt))
        end
        
        def geo_is_domestic(coordinates, opt={})
          hashie get("location/geo/is_domestic.json", :params => {:coordinate => coordinate}.merge(opt))
        end
        
        def pois_show_batch(srcids, opt={})
          hashie get("location/pois/show_batch.json", :params => {:srcids => srcids}.merge(opt))
        end
        
        def pois_search_by_location(opt={})
          hashie get("location/pois/search/by_location.json", :params => opt)
        end
        
        def pois_search_by_geo(opt={})
          hashie get("location/pois/search/by_geo.json", :params => opt)
        end
        
        def pois_search_by_area(coordinates, opt={})
          hashie get("location/pois/search/by_area.json", :params => {:coordinate => coordinate}.merge(opt))
        end
        
        #to implement
        def mobile_get_location(opt={})
          #hashie get("location/mobile/get_location.json", :params => opt)
          nil
        end
        
        def line_drive_route(opt={})
          hashie get("location/line/drive_route.json", :params => opt)
        end
        
        def line_bus_route(opt={})
          hashie get("location/line/bus_route.json", :params => opt)
        end
        
        def line_bus_line(q, opt={})
          hashie get("location/line/bus_line.json", :params => {:q => q}.merge(opt))
        end
        
        def line_bus_station(q, opt={})
          hashie get("location/line/bus_station.json", :params => {:q => q}.merge(opt))
        end
        
        #write interfaces
        def pois_add(srcid, name, address, city_name, category, longitude, latitude, opt={})
          hashie post("location/pois/add.json", :params => {:srcid => srcid,
                                                            :name => name,
                                                            :address => address,
                                                            :city_name => city_name,
                                                            :category => category,
                                                            :longitude => longitude,
                                                            :latitude => latitude}.merge(opt))
        end
        
      end
    end
  end
end
