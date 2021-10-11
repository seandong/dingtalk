module Dingtalk
  class Cipher
    CIPHER = 'AES-256-CBC'.freeze
    BLOCK_SIZE = 32

    attr_reader :corpid, :aes_key, :token

    def initialize(encoding_aes_key:, token:, corpid:)
      @aes_key = Base64.decode64(encoding_aes_key + '=')
      @token = token
      @corpid = corpid
    end

    def encrypt(text)
      text = text.force_encoding('ASCII-8BIT')
      random = SecureRandom.hex(8)
      msg_len = [text.length].pack('N')
      str = encrypt_text "#{random}#{msg_len}#{text}#{corpid}"
      Base64.encode64(str)
    end

    def decrypt(text)
      str = Base64.decode64(text)
      text = decrypt_text(str)
      content = text[16...text.length]
      len_list = content[0...4].unpack('N')
      xml_len = len_list[0]
      result = content[4...4 + xml_len]
      decrypt_corpid = content[xml_len + 4...content.size]
      unless decrypt_corpid == corpid
        raise CorpidNotMatchException,
              "decrypt corpid: #{decrypt_corpid}; current corpid: #{corpid}; result: #{result}"
      end

      result
    end

    private

    def decrypt_text(str)
      text = cipher(:decrypt, aes_key, str)
      pad = text[-1].ord
      pad = 0 if pad < 1 || pad > BLOCK_SIZE
      size = text.size - pad
      text[0...size]
    end

    def encrypt_text(str)
      # 计算需要填充的位数
      amount_to_pad = BLOCK_SIZE - (str.length % BLOCK_SIZE)
      amount_to_pad = BLOCK_SIZE if amount_to_pad.zero?
      # 获得补位所用的字符
      pad_chr = amount_to_pad.chr
      cipher(:encrypt, token, "#{str}#{pad_chr * amount_to_pad}")
    end

    def cipher(method_name, key, str)
      cipher = OpenSSL::Cipher.new(CIPHER)
      cipher.send method_name
      cipher.padding = 0
      cipher.key = key
      cipher.iv = key[0...16]
      cipher.update(str) + cipher.final
    end
  end
end
