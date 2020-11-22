module Dingtalk
  module Api
    module Service
      def get_corp_token(auth_corpid)
        post 'service/get_corp_token', { auth_corpid: auth_corpid }
      end

      def get_permanent_code(tmp_auth_code)
        post 'service/get_permanent_code', { tmp_auth_code: tmp_auth_code }
      end

      def activate_suite(auth_corpid)
        post 'service/activate_suite', {
          auth_corpid: auth_corpid,
          suite_key: suite_key
        }
      end

    end
  end
end
