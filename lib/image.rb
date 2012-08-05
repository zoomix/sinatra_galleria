class Image

  attr :image_path, :name, :description, :thumb

  def initialize(image_path)
  end

  def thumb_path
    @thumb.path if @thumb
  end


end