require 'Image'

describe Image do

  let (:image1) { Image.new(File.expand_path('../resouces/album1/first_image.jpg', __FILE__)) }
  let (:image2) { Image.new(File.expand_path('../resouces/album2/first_image.jpg', __FILE__)) }

  it 'should get the name' do
    image1.name.should == 'first_image'
  end

  it 'should have the path' do
    image1.path.should == File.expand_path('../resouces/album1/first_image.jpg', __FILE__)
  end

  it 'should have the url' do
    image1.url.should == 'photos/album1/first_image.jpg'
  end

  context 'no thumb' do
    it 'should not have thumb' do
      image1.thumb.should be_nil
    end

    it 'should have nil thumb path' do
      image1.thumb_path.should be_nil
    end

    it 'should have nil thumb url' do
      image1.thumb_url.should be_nil
    end
  end

  context 'has thumb' do
    it 'should have a thumb' do
      image2.thumb.should_not be_nil
    end

    it 'should have a thumb path' do
      image2.thumb_path.should == File.expand_path('../resouces/thumbs/album2/first_image.jpg', __FILE__)
    end

    it 'should have a thumb url' do
      image2.thumb_url.should == 'thumbs/album1/first_image.jpg'
    end
  end

end
