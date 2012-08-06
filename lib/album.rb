class Album

  attr :name

  def initialize(path)
    @path = path
    @name = @path.split('/').last
    begin
      @folder = Dir.new(path)
      @valid = true
    rescue Exception => e
      @valid = false
    end
  end

  def images
    list_file_names(@folder).map {|file_name| get_image(@path, file_name)}
  end

  def valid?
    @valid
  end

  private

  def get_image(album_name, file_name)
    Image.new("#{@path}/#{file_name}")
  end

  def list_file_names(folder)
    folder.select {|file_name| file_name[0] != '.'}
  end

end