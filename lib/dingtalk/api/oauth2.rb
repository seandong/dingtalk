module Dingtalk
  module Api
    module Oauth2
      # https://open.dingtalk.com/document/isvapp-server/obtain-user-token
      def user_access_token(code:, client_id:, client_secret:, refresh_token: nil, grant_type: 'authorization_code')
        request.post '/v1.0/oauth2/userAccessToken', {
          code: code,
          clientId: client_id,
          clientSecret: client_secret,
          refreshToken: refresh_token,
          grantType: grant_type,
        }, headers
      end

      private

      def headers
        { base_url: API_BASE_URL_v2 }
      end
    end
  end
end
