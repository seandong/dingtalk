module Dingtalk
  module Api
    module Microapp
      def list
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/queries-applications
        get 'microapp/list'
      end

      def list_by_userid(userid)
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/obtains-the-list-of-applications-visible-to-an-employee
        get 'microapp/list_by_userid', params: { userid: userid }
      end

      def set_visible_scopes(payload = {})
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/set-the-visible-range-of-the-application
        post 'microapp/set_visible_scopes', payload.merge(agent_id: agent_id)
      end

      def visible_scopes
        # https://ding-doc.dingtalk.com/document#/org-dev-guide/obtains-the-application-visible-range
        post 'microapp/visible_scopes', { agent_id: agent_id }
      end
    end
  end
end
