require 'medium_generator'
require 'image'

describe MediumGenerator do

  let (:image1) { Image.new(File.expand_path('../resources', __FILE__), 'album1', 'first_image.jpg') }

  def clean_up
    path = File.expand_path('../resources/scratch/medium/album1', __FILE__)
    FileUtils.rm_rf(path) if File.exists?(path)
  end

  before do
    clean_up    
  end

  after do
    clean_up
  end

  it 'should create thumb' do
    MediumGenerator.generate_medium(image1)
    img = Image.new(File.expand_path('../resources', __FILE__), 'album1', 'first_image.jpg')
    img.medium_url.should == 'scratch/medium/album1/first_image.jpg'
  end

end