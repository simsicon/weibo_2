module WeiboOAuth2
  module Api
    module V2
      class ShortUrl < Base
        #read interfaces
        def shorten(url_long, opt={})
          hashie get("short_url/shorten.json", :params => {:url_long => url_long}.merge(opt))
        end
        
        def expand(url_short, opt={})
          hashie get("short_url/expand.json", :params => {:url_short => url_short}.merge(opt))
        end
        
        def clicks(url_short, opt={})
          hashie get("short_url/clicks.json", :params => {:url_short => url_short}.merge(opt))
        end
        
        def referers(url_short, opt={})
          hashie get("short_url/referers.json", :params => {:url_short => url_short}.merge(opt))
        end
        
        def locations(url_short, opt={})
          hashie get("short_url/locations.json", :params => {:url_short => url_short}.merge(opt))
        end
        
        def share_counts(url_short, opt={})
          hashie get("short_url/share/counts.json", :params => {:url_short => url_short}.merge(opt))
        end
        
        def share_statuses(url_short, opt={})
          hashie get("short_url/share/statuses.json", :params => {:url_short => url_short}.merge(opt))
        end
        
        def comment_counts(url_short, opt={})
          hashie get("short_url/comment/counts.json", :params => {:url_short => url_short}.merge(opt))
        end
        
        def comment_comments(url_short, opt={})
          hashie get("short_url/comment/comments.json", :params => {:url_short => url_short}.merge(opt))
        end
        
        def info(url_short, opt={})
          hashie get("short_url/info.json", :params => {:url_short => url_short}.merge(opt))
        end
        
      end
    end
  end
end
