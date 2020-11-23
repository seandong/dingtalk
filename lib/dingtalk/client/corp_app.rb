require 'dingtalk/client/base'

module Dingtalk
  module Client
    class CorpApp < Base
      attr_reader :app_key, :app_secret, :agent_id

      def initialize(options = {})
        super
        init_attrs :app_key, :app_secret, :agent_id
      end

      def access_token
        token_store.token
      end

      def jsapi_ticket
        jsapi_ticket_store.token
      end

      private

      def token_store
        @token_store ||= Dingtalk::Tokens::CorpAppToken.new(self)
      end

      def jsapi_ticket_store
        @jsapi_ticket_store ||= Dingtalk::Tokens::JsapiTicket.new(self)
      end
    end
  end
end
