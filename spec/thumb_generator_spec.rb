require 'thumb_generator'
require 'image'

describe ThumbGenerator do

  let (:image1) { Image.new(File.expand_path('../resources', __FILE__), 'album1', 'first_image.jpg') }

  def clean_up
    path = File.expand_path('../resources/scratch/thumbs/album1', __FILE__)
    FileUtils.rm_rf(path) if File.exists?(path)
  end

  before do
    clean_up    
  end

  after do
    clean_up
  end

  it 'should create thumb' do
    ThumbGenerator.generate_thumb(image1)
    img = Image.new(File.expand_path('../resources', __FILE__), 'album1', 'first_image.jpg')
    img.thumb_url.should == 'scratch/thumbs/album1/first_image.jpg'
  end

end