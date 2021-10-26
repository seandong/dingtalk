module Dingtalk
  module Api
    module Message
      def corpconversation_sendbytemplate(template_id:, userid_list: nil, dept_id_list: nil, data: {})
        post 'topapi/message/corpconversation/sendbytemplate', {
          agent_id: agent_id,
          template_id: template_id,
          userid_list: userid_list,
          dept_id_list: dept_id_list,
          data: data
        }.compact
      end

      def corpconversation_asyncsend_v2(msg:, userid_list: [], dept_id_list: [], to_all_user: false, options: {})
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/send-work-notifications
        post 'topapi/message/corpconversation/asyncsend_v2', {
          agent_id: agent_id,
          userid_list: userid_list.join(',').presence,
          dept_id_list: dept_id_list.join(',').presence,
          to_all_user: to_all_user,
          msg: msg
        }.compact.merge(options)
      end

      def corpconversation_getsendprogress(task_id)
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/get-work-notification-progess
        post 'topapi/message/corpconversation/getsendprogress', {
          agent_id: agent_id,
          task_id: task_id
        }
      end

      def corpconversation_getsendresult(task_id)
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/get-work-notification-result
        post 'topapi/message/corpconversation/getsendresult', {
          agent_id: agent_id,
          task_id: task_id
        }
      end

      def corpconversation_recall(task_id)
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/withdrawal-work-notification
        post 'topapi/message/corpconversation/recall', {
          agent_id: agent_id,
          task_id: task_id
        }
      end

      def send_to_conversation(sender, cid, msg)
        post 'message/send_to_conversation', { sender: sender, cid: cid, msg: msg }
      end
    end
  end
end
