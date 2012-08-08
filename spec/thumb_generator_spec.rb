require 'thumb_generator'
require 'image'

describe ThumbGenerator do

  let (:image1) { Image.new(File.expand_path('../resources', __FILE__), 'album1', 'first_image.jpg') }

  def clean_up
    puts `rm -rf resources/thumbs/album1` if File.exists?('resources/thumbs/album1')
  end

  before do
    clean_up    
  end

  after do
    # clean_up
  end

  it 'should create thumb' do
    ThumbGenerator.generate_thumb(image1)
  end

end