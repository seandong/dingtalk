require 'dingtalk/request'

module Dingtalk
  module Client
    class Base
      # api_mount :sso

      attr_reader :options

      def initialize(options = {})
        @options = options
      end

      def request
        @request ||= Dingtalk::Request.new(false)
      end

      def get(path, headers = {})
        with_token(headers) do |headers_with_token|
          request.get path, headers_with_token
        end
      end

      def post(path, payload = {}, headers = {})
        with_token(headers) do |headers_with_token|
          request.post path, payload, headers_with_token
        end
      end

      def post_file(path, file, headers = {})
        with_token(headers) do |headers_with_token|
          request.post_file path, file, headers_with_token
        end
      end

      def access_token
        raise NotImplementedError
      end

      private

      def access_token_name
        'access_token'
      end

      def init_attrs(*keys)
        keys.each do |key|
          value = options[key]
          raise Dingtalk::MissingParameterException, "missing parameter: #{k}" if value.nil?

          instance_variable_set("@#{key}", value)
        end
      end

      def token_store
        raise NotImplementedError
      end

      def with_token(headers, tries = 2)
        params = headers[:params] || {}
        params[access_token_name] = access_token
        headers[:params] = params
        yield headers
      rescue Dingtalk::AccessTokenExpiredError
        token_store.fetch_token
        retry unless (tries -= 1).zero?
      end

      class << self
        def api_mount(name)
          class_eval <<-CODE, __FILE__, __LINE__ + 1
            def #{name.to_s.gsub('/', '_')}
              @#{name.to_s.gsub('/', '_')} ||= Class.new(SimpleDelegator) do
                include ::Dingtalk::Api::#{name.to_s.classify}
              end.new(self)
            end
          CODE
        end
      end
    end
  end
end
