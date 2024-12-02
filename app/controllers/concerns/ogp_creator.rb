class OgpCreator
  require 'mini_magick'
  require 'stringio'

  # 動的OGPの実装予定 文字を入れるかは検討中

  BASE_IMAGE_PATH = './app/assets/images/default_share.png'.freeze
  GRAVITY = 'center'.freeze
  TEXT_POSITION = '0,0'.freeze
  FONT = './app/assets/fonts/NotoSansJP-Thin.ttf'.freeze
  FONT_SIZE = 0
  INDENTION_COUNT = 16
  ROW_LIMIT = 8

  def self.build(text)
    text = prepare_text(text)
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)
    image.combine_options do |config|
      config.font FONT
      config.fill 'red'
      config.gravity GRAVITY
      config.pointsize FONT_SIZE
      config.draw "text #{TEXT_POSITION} '#{text}'"
    end
  end

  def self.prepare_text(text)
    text.to_s.scan(/.{1,#{INDENTION_COUNT}}/)[0...ROW_LIMIT].join("\n")
  end
end
