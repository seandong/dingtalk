module Dingtalk
  module Api
    module Service
      def get_corp_token(auth_corpid)
        request.post "service/get_corp_token?#{signature_params.to_query}", {
          auth_corpid: auth_corpid
        }
      end
    end
  end
end