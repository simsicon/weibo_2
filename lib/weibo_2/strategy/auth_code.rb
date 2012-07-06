module WeiboOAuth2
  module Strategy
    class AuthCode < OAuth2::Strategy::AuthCode
      def get_token(code, params={}, opts={})
        params = {'grant_type' => 'authorization_code', 
                  'code' => code, 
                  'redirect_uri' => WeiboOAuth2::Config.redirect_uri.to_s}.merge(client_params).merge(params)
        @client.get_and_restore_token(params, opts)
      end
    end
  end
end