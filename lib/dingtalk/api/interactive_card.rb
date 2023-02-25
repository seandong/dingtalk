module Dingtalk
  module Api
    module InteractiveCard
      # https://open.dingtalk.com/document/isvapp-server/register-an-interaction-card-callback-address
      def callback_register(callback_url:, params: {})
        post '/topapi/im/chat/scencegroup/interactivecard/callback/register', params.merge(
          callback_url: callback_url
        )
      end

      # https://open.dingtalk.com/document/isvapp-server/query-group-information
      def query_group(open_conversation_id:, cool_app_code:)
        post '/v1.0/im/sceneGroups/query', {
          openConversationId: open_conversation_id,
          coolAppCode: cool_app_code,
        }, headers
      end

      # https://open.dingtalk.com/document/isvapp-server/obtains-the-accessible-status-of-cool-applications
      def query_cool_app_status(auth_code:, cool_app_code:, open_conversation_id:)
        post '/v1.0/appMarket/coolApps/accessions/statuses/query', {
          authCode: auth_code,
          coolAppCode: cool_app_code,
          encFieldBizCode: open_conversation_id,
        }, headers
      end

      # https://open.dingtalk.com/document/group/send-interactive-dynamic-cards
      def send(card_template_id:, out_track_id:, conversation_type:, card_data:, params: {})
        post '/v1.0/im/interactiveCards/send', params.merge(
          cardTemplateId: card_template_id,
          outTrackId: out_track_id,
          conversationType: conversation_type,
          cardData: card_data,
        ), headers
      end

      # https://open.dingtalk.com/document/group/update-dingtalk-interactive-cards
      def update(out_track_id:, card_data:, params: {})
        put '/v1.0/im/interactiveCards', params.merge(
          outTrackId: out_track_id,
          cardData: card_data,
        ), headers
      end

      # https://open.dingtalk.com/document/group/create-an-interactive-card-instance
      def create_instance(card_template_id:, out_track_id:, conversation_type:, card_data:, params: {})
        post '/v1.0/im/interactiveCards/instances', params.merge(
          cardTemplateId: card_template_id,
          outTrackId: out_track_id,
          conversationType: conversation_type,
          cardData: card_data,
        ), headers
      end

      # https://open.dingtalk.com/document/group/group-session-open-interactive-card-instance-ceiling
      def open_top_box(open_conversation_id:, out_track_id:, cool_app_code:, params: {})
        post '/v1.0/im/topBoxes/open', params.merge(
          openConversationId: open_conversation_id,
          outTrackId: out_track_id,
          coolAppCode: cool_app_code,
        ), headers
      end

      # https://open.dingtalk.com/document/group/group-session-close-interactive-card-instance-ceiling
      def close_top_box(open_conversation_id:, out_track_id:, cool_app_code:)
        post '/v1.0/im/topBoxes/close', {
          openConversationId: open_conversation_id,
          outTrackId: out_track_id,
          coolAppCode: cool_app_code,
        }, headers
      end

      private

      def headers
        {
          base_url: API_BASE_URL_v2,
          token_name: 'x-acs-dingtalk-access-token',
        }
      end
    end
  end
end
