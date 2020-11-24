module Dingtalk
  module Api
    module Scenegroup
      def create(owner_user_id:, template_id:, params: {})
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/create-chat
        post 'topapi/im/chat/scenegroup/create', params.merge(
          owner_user_id: owner_user_id,
          template_id: template_id
        )
      end

      def delete_member(open_conversation_id, user_ids: [])
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/scene-group-delete
        post 'topapi/im/chat/scenegroup/member/delete', {
          open_conversation_id: open_conversation_id,
          user_ids: user_ids
        }
      end

      def add_member(open_conversation_id, user_ids: [])
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/scene-group-1
        post 'topapi/im/chat/scenegroup/member/add', {
          open_conversation_id: open_conversation_id,
          user_ids: user_ids
        }
      end

      def get_scenegroup(open_conversation_id)
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/queries-the-basic-information-of-a-scenario-group
        get 'topapi/im/chat/scenegroup/get', params: { open_conversation_id: open_conversation_id }
      end

      def get_members(open_conversation_id, cursor: 0, size: 100)
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/obtains-scene-members
        post 'topapi/im/chat/scenegroup/member/get', {
          open_conversation_id: open_conversation_id,
          cursor: cursor,
          size: size
        }
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
