module Dingtalk
  module Api
    module User
      def getuserinfo(code)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/xcdh0r/title-2rk-t4b-wi9
        get 'user/getuserinfo', params: { code: code }
      end
    end
  end
end
