require 'image'

describe Image do

  let (:image1) { Image.new(File.expand_path('../resources', __FILE__), 'album1', 'first_image.jpg') }
  let (:image2) { Image.new(File.expand_path('../resources', __FILE__), 'album2', 'first_image.jpg') }

  it 'should get the name' do
    image1.name.should == 'first_image.jpg'
  end

  it 'should have the url' do
    image1.url.should == 'photos/album1/first_image.jpg'
  end

  context 'no thumb' do
    it 'should not have thumb' do
      image1.thumb.should be_nil
    end

    it 'should have thumb path' do
      image1.thumb_path.should_not be_nil
    end

    it 'should have nil thumb url' do
      image1.thumb_url.should be_nil
    end
  end

  context 'has thumb' do
    it 'should have a thumb' do
      image2.thumb.should_not be_nil
    end

    it 'should have a thumb url' do
      image2.thumb_url.should == 'scratch/thumbs/album2/first_image.jpg'
    end
  end

  context 'dimensions' do
    it 'should have a width' do
      image1.w.should == 625
    end
    it 'should have a height' do
      image1.h.should == 836
    end
  end

end
