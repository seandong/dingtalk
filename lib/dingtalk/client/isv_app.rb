require 'dingtalk/client/base'

module Dingtalk
  module Client
    class IsvApp < Base
      api_mount :auth
      api_mount :user

      attr_reader :corpid, :suite

      delegate :agent_id, :app_id, :suite_id, :suite_key, :suite_secret, :suite_ticket, to: :suite

      def initialize(options = {})
        super
        init_attrs :corpid, :suite
        @agent_id = options[:agent_id]
      end

      def access_token
        token_store.token
      end

      def jsapi_ticket
        jsapi_ticket_store.token
      end

      private

      def token_store
        @token_store ||= Dingtalk::Tokens::IsvAppToken.new(self)
      end

      def jsapi_ticket_store
        @jsapi_ticket_store ||= Dingtalk::Tokens::JsapiTicket.new(self)
      end
    end
  end
end
