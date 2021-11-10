require 'dingtalk/client/base'

module Dingtalk
  module Client
    class SnsApp < Base
      api_mount :sns_auth

      attr_reader :app_id, :app_secret

      def initialize(options = {})
        super
        init_attrs :app_id, :app_secret
      end

      private

      def sns_app_id
        app_id
      end

      def sns_app_secret
        app_secret
      end
    end
  end
end
