require 'dingtalk/client/base'
require 'dingtalk/client/isv_app'

module Dingtalk
  module Client
    class Suite < Base
      api_mount :service
      api_mount :sns_auth

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

      def isv_app(corpid:, agent_id: nil)
        Dingtalk::Client::IsvApp.new(suite: self, corpid: corpid, agent_id: agent_id)
      end

      def sns_app_id
        suite_key
      end

      def sns_app_secret
        suite_secret
      end

      private

      def access_token_name
        'suite_access_token'
      end

      def token_store
        @token_store ||= Dingtalk::Tokens::SuiteToken.new(self)
      end

      class << self
        def default
          @default ||= new(
            suite_id: Dingtalk.config.default_suite_id,
            app_id: Dingtalk.config.default_app_id,
            suite_key: Dingtalk.config.default_suite_key,
            suite_secret: Dingtalk.config.default_suite_secret
          )
        end
      end
    end
  end
end
