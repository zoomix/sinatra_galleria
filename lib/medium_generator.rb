require 'RMagick'
require 'image'

module MediumGenerator

  def self.generate_medium(original_image)
    dir_path = File.dirname(original_image.medium_path)
    FileUtils.mkdir_p(dir_path) unless Dir.exists?(dir_path)

    begin
      img = Magick::Image.read(original_image.path).first
      thumb = img.auto_orient().resize_to_fit(1280, 1280)
      thumb.write(original_image.medium_path) {self.quality = 80}

      img.destroy!
      thumb.destroy!

      puts "generated medium #{original_image.medium_path}"
    rescue Exception => e
      puts "skipping medium for #{original_image.path}"
    end
  end

end
