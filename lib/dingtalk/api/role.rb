module Dingtalk
  module Api
    module Role
      def list(size: 200, offset: 0)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtains-a-list-of-enterprise-roles
        post 'topapi/role/list', { size: size, offset: offset }
      end

      def getrolegroup(group_id)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtains-the-role-group-information
        post 'topapi/role/getrolegroup', { group_id: group_id }
      end

      def getrole(role_id)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/queries-role-details
        post 'topapi/role/getrole', { role_id: role_id }
      end

      def simplelist(role_id, size: 200, offset: 0)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtains-the-list-of-employees-of-a-specified-role
        post 'topapi/role/simplelist', { role_id: role_id, size: size, offset: offset }
      end
    end
  end
end
