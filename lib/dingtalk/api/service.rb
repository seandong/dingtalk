module Dingtalk
  module Api
    module Service
      def get_corp_token(auth_corpid)
        post 'service/get_corp_token', { auth_corpid: auth_corpid }
      end

      def get_auth_info(auth_corpid)
        post 'service/get_auth_info', { auth_corpid: auth_corpid }
      end

      def get_permanent_code(tmp_auth_code)
        post 'service/get_permanent_code', { tmp_auth_code: tmp_auth_code }
      end

      def activate_suite(auth_corpid, permanent_code)
        post 'service/activate_suite', {
          auth_corpid: auth_corpid,
          suite_key: suite_key,
          permanent_code: permanent_code
        }
      end

      def get_unactive_corp
        get 'service/get_unactive_corp', params: {
          app_id: app_id
        }
      end

      def reauth_corp(corpid_list)
        post 'service/reauth_corp', {
          corpid_list: corpid_list
        }
      end

      # private

      # def signature_query
      #   timestamp = (Time.now.to_f * 1000).to_i
      #   sign_str = OpenSSL::HMAC.digest(
      #     OpenSSL::Digest::SHA256.new,
      #     suite_secret,
      #     "#{timestamp}\n#{suite_ticket}"
      #   )
      #   signature = ERB::Util.url_encode Base64.strict_encode64(sign_str)
      #   {
      #     accessKey: suite_key,
      #     timestamp: timestamp,
      #     suiteTicket: suite_ticket,
      #     signature: signature
      #   }.to_query
      # end
    end
  end
end
