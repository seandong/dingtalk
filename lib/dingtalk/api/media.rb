module Dingtalk
  module Api
    module Media
      def upload(media, media_type)
        post_file 'media/upload', media, params: { type: media_type }
      end
    end
  end
end
