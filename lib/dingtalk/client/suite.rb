require 'dingtalk/client/base'
require 'dingtalk/client/isv_app'

module Dingtalk
  module Client
    class Suite < Base
      api_mount :service

      attr_reader :suite_id, :app_id, :suite_key, :suite_secret

      def initialize(options = {})
        super
        init_attrs :suite_id, :app_id, :suite_key, :suite_secret
      end

      def suite_ticket=(new_ticket)
        Dingtalk.redis.set "suite_ticket_#{suite_id}", new_ticket
      end

      def suite_ticket
        Dingtalk.redis.get "suite_ticket_#{suite_id}"
      end

      def access_token
        token_store.token
      end

      def isv_app(corpid:)
        Dingtalk::Client::IsvApp.new(suite: self, corpid: corpid)
      end

      private

      def access_token_name
        'suite_access_token'
      end

      def token_store
        @token_store ||= Dingtalk::Tokens::SuiteToken.new(self)
      end
    end
  end
end
