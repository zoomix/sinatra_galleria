class Thumb

  attr :path, :url

  def initialize(path)
    @path = path
    path_array = path.split('/')
    @url = "thumbs/#{path_array[-2]}/#{path_array[-1]}"
  end


end