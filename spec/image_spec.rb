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

  context 'medium size images' do
    it 'should return medium size image if it is present' do
      image2.medium_url.should == 'scratch/medium/album2/first_image.jpg'
    end

    it 'should fallback on full size image if no medium is present' do
      image1.medium_url.should == 'photos/album1/first_image.jpg'
    end
  end


  context 'dimensions from medium when medium images are generated' do
    it 'should have a width' do
      image2.w.should == 375
    end
    it 'should have a height' do
      image2.h.should == 502
    end
  end

  context 'dimensions when no medium is generated' do
    it 'should have a width' do
      image1.w.should == 625
    end
    it 'should have a height' do
      image1.h.should == 836
    end
  end

end
