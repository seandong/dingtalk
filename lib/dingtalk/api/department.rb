module Dingtalk
  module Api
    module Department
      def get_department(dept_id, language: 'zh_CN')
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/queries-user-details-new
        post 'topapi/v2/department/get', { dept_id: dept_id, language: language }
      end

      def listsub(dept_id, language: 'zh_CN')
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtain-the-department-list-1
        post 'topapi/v2/department/listsub', { dept_id: dept_id, language: language }
      end

      def listsubid(dept_id)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtain-a-sub-department-id-list-1
        post 'topapi/v2/department/listsubid', { dept_id: dept_id }
      end

      def listparentbyuser(userid)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtains-the-list-of-all-parent-departments-of-a-user
        post 'topapi/v2/department/listparentbyuser', { userid: userid }
      end

      def listparentbydept(dept_id)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtains-the-list-of-all-parent-departments-of-a-specified
        post 'topapi/v2/department/listparentbydept', { dept_id: dept_id }
      end
    end
  end
end
