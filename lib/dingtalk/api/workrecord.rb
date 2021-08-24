module Dingtalk
  module Api
    module Workrecord
      def add(payload = {})
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/initiate-a-to-do-list
        post 'topapi/workrecord/add', payload
      end

      def update(userid, record_id)
        # https://ding-doc.dingtalk.com/document#/isv-dev-guide/update-to-do-status-1
        post 'topapi/workrecord/update', { userid: userid, record_id: record_id }
      end
    end
  end
end
