require 'Thumb'

class Image

  attr :path, :url, :name, :description, :thumb

  def initialize(path)
    @path = path
    path_array = path.split('/')
    @url = "photos/#{path_array[-2]}/#{path_array[-1]}"
    @name = path_array.last
    @description = 'dummy'

    thumb_path = "/#{path_array[0..-4].join('/')}/thumbs/#{path_array[-2]}/#{path_array[-1]}"    
    @thumb = Thumb.new(thumb_path) if File.exists?(thumb_path)
  end

  def thumb_url
    @thumb.url if @thumb
  end

  def thumb_path
    @thumb.path if @thumb
  end

end