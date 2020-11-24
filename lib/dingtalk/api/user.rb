module Dingtalk
  module Api
    module User
      def getuserinfo(code)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/xcdh0r/title-2rk-t4b-wi9
        get 'user/getuserinfo', params: { code: code }
      end

      def get_user(userid, language: 'zh_CN')
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/queries-user-details-new
        get 'topapi/v2/user/get', params: { userid: userid, language: language }
      end

      def listid(dept_id)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/query-the-userid-list-of-a-department
        get 'topapi/user/listid', params: { dept_id: dept_id }
      end

      def listsimple(dept_id, cursor: 0, size: 100, order_field: 'custom', contain_access_limit: false, language: 'zh_CN')
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtains-the-basic-information-of-a-department-user
        post 'topapi/user/listsimple', {
          dept_id: dept_id,
          language: language,
          cursor: cursor,
          size: size,
          order_field: order_field,
          contain_access_limit: contain_access_limit
        }
      end

      def list(dept_id, cursor: 0, size: 100, order_field: 'custom', language: 'zh_CN')
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/queries-department-user-details
        post 'topapi/v2/user/list', {
          dept_id: dept_id,
          language: language,
          cursor: cursor,
          size: size,
          order_field: order_field
        }
      end

      def get_userid_by_unionid(unionid)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/you-can-call-this-operation-to-retrieve-the-userids-of
        get 'user/getUseridByUnionid', params: { unionid: unionid }
      end

      def listadmin
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtains-a-list-of-administrators
        post 'topapi/user/listadmin'
      end

      def get_admin_scope(userid)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/query-permissions-of-the-administrator-address-book
        post 'topapi/user/get_admin_scope', { userid: userid }
      end

      def can_access_microapp(userid)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtains-the-application-management-permission-of-a-administrator
        get 'user/can_access_microapp', params: { userid: userid, appId: app_id }
      end

      def get_org_user_count(only_active = 0)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtain-the-number-of-employees
        get 'user/get_org_user_count', params: { onlyActive: only_active }
      end
    end
  end
end
