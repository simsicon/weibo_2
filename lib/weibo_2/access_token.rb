module WeiboOAuth2
  module Strategy
    class AccessToken < OAuth2::AccessToken
      
      def validated?
        !!@expires_at && !expired?
      end
    end
  end
end