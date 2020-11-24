module Dingtalk
  module Api
    module Auth
      def scopes
        get 'auth/scopes'
      end
    end
  end
end
