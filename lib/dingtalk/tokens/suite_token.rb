require 'dingtalk/tokens/base'

module Dingtalk
  module Tokens
    class SuiteToken < Base
      def key
        'suite_access_token'
      end

      def redis_key
        @redis_key ||= Digest::MD5.hexdigest "#{self.class.name}_#{client.suite_key}"
      end

      def fetch_token
        client.request.post 'service/get_suite_token', {
          suite_key: client.suite_key,
          suite_secret: client.suite_secret,
          suiteTicket: client.suite_ticket
        }
      end
    end
  end
end