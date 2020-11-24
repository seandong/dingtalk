module Dingtalk
  module Api
    module Sso
      def gettoken(corpid, ssosecret)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/ydc8us
        request.get 'sso/gettoken', params: { corpid: corpid, corpsecret: ssosecret }
      end

      def getuserinfo(code, ssotoken)
        request.get 'sso/getuserinfo', params: { code: code, access_token: ssotoken }
      end
    end
  end
end
