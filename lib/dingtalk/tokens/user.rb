require 'dingtalk/tokens/base'

module Dingtalk
  module Tokens
    class User < Base
      def key
        'accessToken'
      end

      def redis_key
        @redis_key ||= Digest::MD5.hexdigest "#{self.class.name}_#{client.client_id}_#{client.code}"
      end

      def expires_key
        'expireIn'
      end

      def fetch_token
        client.oauth2.user_access_token(code: client.code, client_id: client.client_id, client_secret: client.client_secret)
      end
    end
  end
end
