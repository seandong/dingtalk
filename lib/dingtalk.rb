require 'dingtalk/version'
require 'redis'
require 'active_support/all'
require 'dingtalk/config'
require 'dingtalk/cipher'
require 'dingtalk/helper'

lib_path = "#{File.dirname(__FILE__)}/dingtalk"
Dir["#{lib_path}/apis/**/*.rb",  "#{lib_path}/token_store/*.rb"].each { |path| require path }

require 'dingtalk/api'

module Dingtalk
  API_BASE_URL = 'https://open.feishu.cn/open-apis/'.freeze

  # Exceptions
  class RedisNotConfigException < RuntimeError; end
  class AppNotConfigException < RuntimeError; end
  class AccessTokenExpiredError < RuntimeError; end
  class ResultErrorException < RuntimeError; end
  class ResponseError < StandardError
    attr_reader :error_code
    def initialize(errcode, errmsg = '')
      @error_code = errcode
      super "(#{error_code}) #{errmsg}"
    end
  end
end
