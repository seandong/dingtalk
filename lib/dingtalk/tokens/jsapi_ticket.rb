require 'dingtalk/tokens/base'

module Dingtalk
  module Tokens
    class JsapiTicket < Base
      def key
        'ticket'
      end

      def redis_key
        @redis_key ||= Digest::MD5.hexdigest "#{self.class.name}_#{client.corpid}_#{client.app_id}"
      end

      def fetch_token
        client.post 'service/get_jsapi_ticket'
      end
    end
  end
end
