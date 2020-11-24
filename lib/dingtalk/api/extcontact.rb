module Dingtalk
  module Api
    module Extcontact
      def listlabelgroups(size: 200, offset: 0)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/get-external-contact-label-list-1
        post 'topapi/extcontact/listlabelgroups', { size: size, offset: offset }
      end

      def get_extcontact(user_id)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtain-external-contact-details-1
        post 'topapi/extcontact/get', { user_id: user_id }
      end

      def list(size: 200, offset: 0)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/get-external-contact-list-1
        post 'topapi/extcontact/list', { size: size, offset: offset }
      end
    end
  end
end
