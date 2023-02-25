require 'dingtalk/version'
require 'redis'
require 'active_support/all'
require 'dingtalk/config'
require 'dingtalk/errors'
require 'dingtalk/cipher'

lib_path = "#{File.dirname(__FILE__)}/dingtalk"
Dir["#{lib_path}/api/**/*.rb",  "#{lib_path}/tokens/*.rb"].each { |path| require path }

require 'dingtalk/client/user'
require 'dingtalk/client/suite'
require 'dingtalk/client/corp_app'
