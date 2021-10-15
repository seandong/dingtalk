module Dingtalk
  module Api
    module Jsapi
      def signature_package(url)
        noncestr = SecureRandom.hex(4)
        timestamp = Time.now.to_i.to_s
        signature = Digest::SHA1.hexdigest(
          "jsapi_ticket=#{jsapi_ticket}&noncestr=#{noncestr}&timestamp=#{timestamp}&url=#{url}"
        )

        {
          url: url,
          agentId: agent_id,
          nonceStr: noncestr,
          timestamp: timestamp,
          corpId: corpid,
          signature: signature
        }
      end
    end
  end
end