module Dingtalk
  module Api
    module Sns
      def authorize_url(redirect_uri, state, scope = 'snsapi_auth')
        redirect_uri = ERB::Util.url_encode(redirect_uri)
        path = URI.join(API_BASE_URL, 'connect/oauth2/sns_authorize')
        "#{path}?appid=#{app_id}&response_type=code&scope=#{scope}&state=#{state}&redirect_uri=#{redirect_uri}"
      end

      def getuserinfo_bycode(tmp_auth_code)
        request.post 'sns/getuserinfo_bycode', {
          tmp_auth_code: tmp_auth_code
        }, params: signature_params
      end
    end
  end
end
