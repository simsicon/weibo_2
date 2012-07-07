module WeiboOAuth2
  class AccessToken < OAuth2::AccessToken
    
    def validated?
      !!@expires_at && !expired?
    end
  end
end