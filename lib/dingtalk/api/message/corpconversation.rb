module Dingtalk
  module Api
    module Message
      module Corpconversation
        def asyncsend_v2(msg:, userid_list: [], dept_id_list: [], to_all_user: false, options: {})
          # https://ding-doc.dingtalk.com/document#/org-dev-guide/send-work-notifications
          post 'topapi/message/corpconversation/asyncsend_v2', {
            agent_id: agent_id,
            userid_list: userid_list,
            dept_id_list: dept_id_list,
            to_all_user: to_all_user,
            msg: msg
          }.merge(options)
        end

        def getsendprogress(task_id)
          # https://ding-doc.dingtalk.com/document#/org-dev-guide/get-work-notification-progess
          post 'topapi/message/corpconversation/getsendprogress', {
            agent_id: agent_id,
            task_id: task_id
          }
        end

        def getsendresult(task_id)
          # https://ding-doc.dingtalk.com/document#/org-dev-guide/get-work-notification-result
          post 'topapi/message/corpconversation/getsendresult', {
            agent_id: agent_id,
            task_id: task_id
          }
        end

        def recall(task_id)
          # https://ding-doc.dingtalk.com/document#/org-dev-guide/withdrawal-work-notification
          post 'topapi/message/corpconversation/recall', {
            agent_id: agent_id,
            task_id: task_id
          }
        end
      end
    end
  end
end
