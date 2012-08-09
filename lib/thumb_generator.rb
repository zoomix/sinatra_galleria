require 'rmagick'
require 'image'

module ThumbGenerator

  def self.generate_thumb(original_image)
    dir_path = File.dirname(original_image.thumb_path)
    FileUtils.mkdir_p(dir_path) unless Dir.exists?(dir_path)

    img = Magick::Image.read(original_image.path).first
    thumb = img.resize_to_fill(160, 160)
    thumb.write(original_image.thumb_path) {self.quality = 70}
  end

end