module Dingtalk
  module Api
    module Sns
      def authorize_url(redirect_uri, state, scope = 'snsapi_auth')
        redirect_uri = ERB::Util.url_encode(redirect_uri)
        path = URI.join(API_BASE_URL, 'connect/oauth2/sns_authorize')
        "#{path}?appid=#{sns_app_id}&response_type=code&scope=#{scope}&state=#{state}&redirect_uri=#{redirect_uri}"
      end

      def getuserinfo_bycode(tmp_auth_code)
        request.post 'sns/getuserinfo_bycode', {
          tmp_auth_code: tmp_auth_code
        }, params: signature_params
      end

      private

      def signature_params
        timestamp = (Time.now.to_f * 1000).to_i
        sign_str = OpenSSL::HMAC.digest(
          OpenSSL::Digest.new('sha256'),
          sns_app_secret,
          timestamp.to_s
        )
        signature = Base64.encode64(sign_str).strip
        {
          accessKey: sns_app_id,
          timestamp: timestamp,
          signature: signature
        }
      end
    end
  end
end
