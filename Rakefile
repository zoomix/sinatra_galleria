$: << File.expand_path('../lib', __FILE__)

require 'albums'
require 'thumb_generator'
require 'medium_generator'

desc "Generats thumbnails"
task :thumb_gen do
  Albums.list.each do |album|
    album.images.each do |image|
      ThumbGenerator.generate_thumb(image) unless image.thumb
    end
  end
end

desc "Generats medium size pics"
task :med_gen do
  Albums.list.each do |album|
    album.images.each do |image|
      MediumGenerator.generate_medium(image) unless image.medium
    end
  end
end
