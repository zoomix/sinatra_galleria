require 'album'
require 'image'

describe Album do

  let(:album1) { Album.new(File.expand_path('../resources', __FILE__), 'album1') }

  context 'name' do
    it 'sets the album as invalid if the album is wrong' do
      a = Album.new(File.expand_path('nothing'), '')
      a.should_not be_valid
    end

    it 'existing albums should be valid' do
      album1.should be_valid
    end

    it 'gets the name from the foldername' do
      album1.name.should == 'album1'
    end
  end

  context 'images' do
    it 'gets all the images' do
      album1.images.size.should == 1
    end

    it 'has first image' do
      album1.should_receive(:get_image).with('first_image.jpg')
      album1.images
    end    
  end

end