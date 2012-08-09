$: << File.expand_path('../lib', __FILE__)

require 'albums'
require 'thumb_generator'

desc "Generats thumbnails"
task :thumb_gen do
  Albums.list.each do |album|
    album.images.each do |image|
      puts "Generating thumb for #{image.name} in #{album.name}. #{image.thumb_path}"
      ThumbGenerator.generate_thumb(image) unless image.thumb
    end
  end
end