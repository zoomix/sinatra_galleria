require 'album'

module Albums
  def self.list
    photos_path = 'public/photos'
    Dir.entries(photos_path, :encoding => 'UTF-8').sort.select {|x| File.directory?("#{photos_path}/#{x}") and x[0] != '.' }.map do |album_name|
      Album.new(File.expand_path("../../public", __FILE__), album_name)
    end
  end
end