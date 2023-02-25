module Dingtalk
  module Api
    module Contact
      # https://open.dingtalk.com/document/isvapp-server/dingtalk-retrieve-user-information
      def user_info(union_id:)
        get "/v1.0/contact/users/#{union_id}", headers
      end

      private

      def headers
        { base_url: API_BASE_URL_v2 }
      end
    end
  end
end
