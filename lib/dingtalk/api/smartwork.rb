module Dingtalk
  module Api
    module Smartwork
      def preentry_employee(offset: 0, size: 50)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtains-the-list-of-employees-to-be-hired
        post 'topapi/smartwork/hrm/employee/querypreentry', { offset: offset, size: size }
      end

      def onjob_employee(status_list:, offset: 0, size: 50)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtain-the-list-of-employees
        post 'topapi/smartwork/hrm/employee/queryonjob', { offset: offset, size: size, status_list: status_list }
      end

      def dimission_employee(offset: 0, size: 50)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtain-the-list-of-employees-who-have-left
        post 'topapi/smartwork/hrm/employee/querydimission', { offset: offset, size: size }
      end

      def listdimission(userid_list = [])
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/obtain-employee-turnover-information
        post 'topapi/smartwork/hrm/employee/listdimission', { userid_list: userid_list }
      end
    end
  end
end
