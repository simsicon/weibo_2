module WeiboOAuth2
  module Strategy
    class AuthCode < OAuth2::Strategy::AuthCode
      def get_token(code, params={}, opts={})
        params = {'grant_type' => 'authorization_code', 'code' => code}.merge(client_params).merge(params)
        @client.get_and_restore_token(params, opts)
      end
    end
  end
end