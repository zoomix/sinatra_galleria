require 'thumb'
require 'fastimage'

class Image

  attr :url, :name, :description, :thumb, :thumb_path, :path, :w, :h

  def initialize(base_path, album_name, file_name)
    @url = "photos/#{album_name}/#{file_name}"
    @path = File.expand_path(@url, base_path)
    @name = file_name
    @description = 'dummy'
    img_sizes = FastImage.size(@path)
    @w = img_sizes.first
    @h = img_sizes.last

    @thumb_path = File.expand_path("thumbs/#{album_name}/#{file_name}", base_path)
    @thumb = Thumb.new(base_path, album_name, file_name) if File.exists?(thumb_path)
  end

  def valid?
    @thumb
  end

  def thumb_url
    @thumb.url if @thumb
  end

  def to_pswph
    {
      src: @url.force_encoding('utf-8'),
      msrc: thumb_url.force_encoding('utf-8'),
      w: @w,
      h: @h
    }
  end

end