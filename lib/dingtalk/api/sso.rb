module Dingtalk
  module Api
    module Sso
      def gettoken(isv_corpid, ssosecret)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/ydc8us
        get 'sso/gettoken', params: { corpid: isv_corpid, corpsecret: ssosecret }
      end

      def getuserinfo(code, sso_access_token)
        get 'sso/getuserinfo', params: { code: code, access_token: sso_access_token }
      end
    end
  end
end
