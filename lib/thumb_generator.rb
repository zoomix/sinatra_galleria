require 'image_sorcery'
require 'image'

module ThumbGenerator

  def self.generate_thumb(original_image)
    dir_path = File.dirname(original_image.thumb_path)
    Dir.mkdir(dir_path) unless Dir.exists?(dir_path)
    # f = File.new(image.thumb_path, 'w')
    # f.puts ThumbNailer.box_with_transparancy(image.path, 125)
    # f.close
    image = Sorcery.new(original_image.path)
    p image.identify # => "image.png PNG 500x500 500x500+0+0 8-bit DirectClass 236KB 0.010u 0:00.010\n"
    # p image.manipulate!(scale: "50%") # => true
    p image.dimensions # => { x: 250, y: 250 }
    p image.convert("thumbnail.jpg", quality: 80, crop: "100x100>") # => true
  end

end