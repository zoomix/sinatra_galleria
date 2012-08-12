require 'thumb'

class Image

  attr :url, :name, :description, :thumb, :thumb_path, :path

  def initialize(base_path, album_name, file_name)
    @url = "photos/#{album_name}/#{file_name}"
    @path = File.expand_path(@url, base_path)
    @name = file_name
    @description = 'dummy'

    @thumb_path = File.expand_path("thumbs/#{album_name}/#{file_name}", base_path)
    @thumb = Thumb.new(base_path, album_name, file_name) if File.exists?(thumb_path)
  end

  def valid?
    @thumb
  end

  def thumb_url
    @thumb.url if @thumb
  end

end