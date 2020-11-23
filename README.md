[![Gem Version](https://badge.fury.io/rb/dingtalk-sdk.svg)](https://badge.fury.io/rb/dingtalk-sdk)

> Ruby SDKs for Dingtalk(钉钉) API https://open.dingtalk.com/

## 安装

Add this line to your application's Gemfile:

```ruby
gem 'dingtalk-sdk'
```

And then execute:

	$ bundle install

Or install it yourself as:

	$ gem install dingtalk-sdk

	require 'dingtalk/sdk'

## 使用说明

### 初始化 SDK

```ruby
# config/initializers/dingtalk.rb

Dingtalk.configure do |config|
  config.redis = Redis.new
  # ...
end
```

### HTTP 回调

> 回调数据签名和解密：

```ruby
# 实例化回调对象
callback = Dingtalk::Callback.new(
  encoding_aes_key: encoding_aes_key,
  token: token,
  corpid: corpid # 第三方应用使用 SuiteKey
)

# 数据解密
callback.decrypt(encrypt_str)

# 返回数据签名
callback.encrypt(message)
```

### 实例化套件 (suite)

```ruby
suite = Dingtalk::Client::Suite.new(
  suite_id: suite_id,
  app_id: app_id,
  suite_key: suite_key,
  suite_secret: suite_secret
)
```

更新 `suite_ticket`

```ruby
suite.suite_ticket = xxx
```

### 实例化应用


#### 第三方应用

```ruby
app = Dingtalk::Client::IsvApp.new(
	agent_id: agent_id,
	corpid: corpid,
	suite: suite # 套件对象
)

# 或者通过套件实例化
app = suite.isv_app(corpid: corpid, agent_id: agent_id)
```

#### 企业内部应用

```ruby
app = Dingtalk::Client::CorpApp.new(
  app_key: app_key,
  app_secret: app_secret,
  agent_id: agent_id
)
```

#### 获取 `jsapi_ticket`

```ruby
app.jsapi_ticket
```

## API 列表

[Api 列表](https://github.com/mycolorway/dingtalk-ruby-sdk/wiki/API-List)


## 贡献

如果你有好的意见或建议，欢迎给我们提issue或pull request。

## License

The MIT License(http://opensource.org/licenses/MIT)

请自由地享受和参与开源
