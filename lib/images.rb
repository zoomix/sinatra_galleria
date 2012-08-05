module Images
  def Images.list_images
    Dir.new('./public/photos/').select {|entry| entry[0] != '.'}
  end
end