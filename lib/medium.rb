class Medium

  attr :path, :url

  def initialize(base_path, album_name, file_name)
    @path = File.expand_path("medium/#{album_name}/#{file_name}", base_path)
    @url = "medium/#{album_name}/#{file_name}"
  end


end