require 'dingtalk/client/base'

module Dingtalk
  module Client
    class CorpApp < Base
      api_mount :auth
      api_mount :call_back
      api_mount :chat
      api_mount :department
      api_mount :extcontact
      api_mount :media
      api_mount :message
      api_mount :microapp
      api_mount :org_union
      api_mount :robot
      api_mount :role
      api_mount :scenegroup
      api_mount :smartwork
      api_mount :sns_auth
      api_mount :sso
      api_mount :user
      api_mount :workrecord
      api_mount :jsapi

      attr_reader :app_key, :app_secret, :agent_id, :corpid

      def initialize(options = {})
        super
        init_attrs :app_key, :app_secret, :agent_id, :corpid
      end

      def access_token
        token_store.token
      end

      def jsapi_ticket
        jsapi_ticket_store.token
      end

      def app_id
        app_key
      end

      def sns_app_id
        app_key
      end

      def sns_app_secret
        app_secret
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
