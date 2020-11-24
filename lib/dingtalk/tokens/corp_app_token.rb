require 'dingtalk/tokens/base'

module Dingtalk
  module Tokens
    class CorpAppToken < Base
      def redis_key
        @redis_key ||= Digest::MD5.hexdigest "#{self.class.name}_#{client.app_key}"
      end

      def fetch_token
        client.request.get 'gettoken', params: {
          appkey: client.app_key,
          appsecret: client.app_secret
        }
      end
    end
  end
end
