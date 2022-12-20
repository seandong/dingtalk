require 'dingtalk/client/base'

module Dingtalk
  module Client
    class User < Base
      api_mount :oauth2
      api_mount :contact

      attr_reader :code, :suite_key, :suite_secret

      def initialize(options = {})
        super
        @options[:suite_key] = Dingtalk.config.default_suite_key
        @options[:suite_secret] = Dingtalk.config.default_suite_secret
        init_attrs :code, :suite_key, :suite_secret
      end

      def access_token
        token_store.token
      end

      def client_id
        suite_key
      end

      def client_secret
        suite_secret
      end

      private

      def access_token_name
        'x-acs-dingtalk-access-token'
      end

      def token_store
        @token_store ||= Dingtalk::Tokens::User.new(self)
      end
    end
  end
end
