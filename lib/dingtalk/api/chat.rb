module Dingtalk
  module Api
    module Chat
      def create_chat(name:, owner:, useridlist: [], params: {})
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/create-chat
        post 'chat/create', params.merge(
          name: name,
          owner: owner,
          useridlist: useridlist
        )
      end

      def get_chat(chatid)
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/get-chat-detail
        get 'chat/get', params: { chatid: chatid }
      end

      def update_chat(chatid, params = {})
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/update-chat-config
        post 'chat/update', params.merge(chatid: chatid)
      end

      def private_chat(chatid, is_prohibit = false)
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/set-private-chat
        post 'topapi/chat/member/friendswitch/update', { chatid: chatid, is_prohibit: is_prohibit }
      end

      def chat_admin(chatid:, userids:, role:)
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/set-chat-admin
        post 'topapi/chat/subadmin/update', { chatid: chatid, userids: userids, role: role }
      end

      def send_message(chatid, msg = {})
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/send-chat-messages
        post 'chat/send', { chatid: chatid, msg: msg }
      end

      def get_read_list(message_id, cursor: 0, size: 100)
        get 'chat/getReadList', params: {
          message_id: message_id,
          cursor: cursor,
          size: size
        }
      end
    end
  end
end
