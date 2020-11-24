module Dingtalk
  module Api
    module Robot
      def send_message(open_conversation_id:, msg_key:, msg_param:, receiver_user_ids: [], at_user_ids: [])
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/send-a-dingtalk-robot-message
        post 'topapi/robot/org/intelligent/message/send', {
          open_conversation_id: open_conversation_id,
          msg_key: msg_key,
          msg_param: msg_param,
          receiver_user_ids: receiver_user_ids,
          at_user_ids: at_user_ids
        }
      end
    end
  end
end
