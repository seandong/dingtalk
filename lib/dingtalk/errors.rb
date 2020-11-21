module Dingtalk
  # Exceptions
  class RedisNotConfigException < RuntimeError; end
  class MissingParameterException < RuntimeError; end
  class AccessTokensExpiredError < RuntimeError; end
  class ResultErrorException < RuntimeError; end

  class ResponseError < StandardError
    attr_reader :error_code
    def initialize(errcode, errmsg = '')
      @error_code = errcode
      super "(#{error_code}) #{errmsg}"
    end
  end
end