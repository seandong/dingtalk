module Dingtalk
  module Api
    module OrgUnion
      def trunk
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtain-backbone-organization-list
        post 'topapi/org/union/trunk/get'
      end

      def branch
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtains-the-branch-organization-list
        post 'topapi/org/union/branch/get'
      end
    end
  end
end
