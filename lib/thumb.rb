class Thumb

  attr :path, :url

  def initialize(base_path, album_name, file_name)
    @path = File.expand_path("thumbs/#{album_name}/#{file_name}", base_path)
    @url = "thumbs/#{album_name}/#{file_name}"
  end


end