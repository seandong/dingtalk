module Dingtalk
  module Api
    module CallBack
      def register_call_back(call_back_tag:, token:, aes_key:, url:)
        post 'call_back/register_call_back', {
          call_back_tag: call_back_tag,
          token: token,
          aes_key: aes_key,
          url: url
        }
      end

      def update_call_back(call_back_tag:, token:, aes_key:, url:)
        post 'call_back/update_call_back', {
          call_back_tag: call_back_tag,
          token: token,
          aes_key: aes_key,
          url: url
        }
      end

      def get_call_back_failed_result
        get 'call_back/get_call_back_failed_result'
      end

      def get_call_back
        get 'call_back/get_call_back'
      end

      def delete_call_back
        get 'call_back/delete_call_back'
      end
    end
  end
end
