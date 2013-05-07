require 'hashie'
require 'json'
require 'net/http/post/multipart'

module WeiboOAuth2
  module Api
    module V2
      class Base
        extend Forwardable
        
        def_delegators :@access_token, :get, :post, :put, :delete
        
        @@API_VERSION = 2
        
        def initialize(access_token)
          @access_token = access_token
        end
        
        def hashie(response)
          json_body = MultiJson.load(response.body)
          if json_body.is_a? Array
            Array.new(json_body.count){|i| Hashie::Mash.new(json_body[i])}
          else
            Hashie::Mash.new json_body
          end
        end
        
        protected
        def self.mime_type(file)
          case
            when file =~ /\.jpg$/i then 'image/jpg'
            when file =~ /\.gif$/i then 'image/gif'
            when file =~ /\.png$/i then 'image/png'
            else 'application/octet-stream'
          end
        end

        def self.bin_encode(chunk)
          chunk.force_encoding(Encoding::BINARY) if chunk.respond_to? :force_encoding
        end
        
        CRLF = "\r\n"
        def self.build_multipart_bodies(parts)
          boundary = Time.now.to_i.to_s(16)
          body = bin_encode("")
          parts.each do |key, value|
            esc_key = CGI.escape(key.to_s)
            body << bin_encode("--#{boundary}#{CRLF}")
            if value.respond_to?(:read)
              body << bin_encode("Content-Disposition: form-data; name=\"#{esc_key}\"; filename=\"#{File.basename(value.path)}\"#{CRLF}")
              body << bin_encode("Content-Type: #{mime_type(value.path)}#{CRLF*2}")
              body << bin_encode(value.read)
            else
              body << bin_encode("Content-Disposition: form-data; name=\"#{esc_key}\"#{CRLF*2}#{value}")
            end
            body << bin_encode(CRLF)
          end
          body << bin_encode("--#{boundary}--#{CRLF*2}")
          
          {
            :body => body,
            :headers => {"Content-Type" => "multipart/form-data; boundary=#{boundary}"}
          }
        end
        
      end
    end
  end
end