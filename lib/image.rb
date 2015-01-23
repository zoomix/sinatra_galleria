require 'thumb'
require 'medium'
require 'fastimage'

class Image

  attr :url, :name, :description, :thumb, :thumb_path, :medium, :medium_path, :path, :w, :h

  def initialize(base_path, album_name, file_name)
    @url = "photos/#{album_name}/#{file_name}"
    @path = File.expand_path(@url, base_path)
    @name = file_name
    @description = 'dummy'

    @thumb_path = File.expand_path("scratch/thumbs/#{album_name}/#{file_name}", base_path)
    @thumb = Thumb.new(base_path, album_name, file_name) if File.exists?(thumb_path)
    @medium_path = File.expand_path("scratch/medium/#{album_name}/#{file_name}", base_path)
    @medium = Medium.new(base_path, album_name, file_name) if File.exists?(medium_path)

    set_dimensions
  end

  def valid?
    @thumb
  end

  def thumb_url
    @thumb.url if @thumb
  end

  def medium_url #Fallbacks on original image if no mediums have been generated
    @medium && @medium.url || @url
  end

  def set_dimensions
    img_path_to_use = @medium && @medium_path || @path #Prefer medium path to actual path since medium is used in the gallery
    img_sizes = FastImage.size(img_path_to_use) 
    @w, @h = img_sizes || [0, 0]
  end

  def to_pswph
    {
      fsrc: @url.force_encoding('utf-8'),
      src: medium_url.force_encoding('utf-8'),
      msrc: thumb_url.force_encoding('utf-8'),
      w: @w,
      h: @h
    }
  end

end