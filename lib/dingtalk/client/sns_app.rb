require 'dingtalk/client/base'

module Dingtalk
  module Client
    class SnsApp < Base
      api_mount :sns

      attr_reader :app_id, :app_secret

      def initialize(options = {})
        super
        init_attrs :app_id, :app_secret
      end

      private

      def signature_params
        timestamp = (Time.now.to_f * 1000).to_i
        sign_str = OpenSSL::HMAC.digest(
          OpenSSL::Digest.new('sha256'),
          app_secret,
          timestamp.to_s
        )
        signature = ERB::Util.url_encode Base64.encode64(sign_str).strip
        {
          accessKey: app_id,
          timestamp: timestamp,
          signature: signature
        }
      end
    end
  end
end
