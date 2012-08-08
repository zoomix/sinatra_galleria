class Album

  attr :name

  def initialize(base_path, album_name)
    @path = File.expand_path("photos/#{album_name}", base_path)
    @name = album_name
    begin
      @folder = Dir.new(@path)
      @valid = true
    rescue Exception => e
      puts e.message
      @valid = false
    end
  end

  def images
    list_file_names(@folder).map {|file_name| get_image(file_name)}
  end

  def valid?
    @valid
  end

  private

  def get_image(file_name)
    Image.new(@path, @name, file_name)
  end

  def list_file_names(folder)
    folder.select {|file_name| file_name[0] != '.'}
  end

end