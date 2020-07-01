class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :standard do
    process resize_to_fit: [500, 300, :north]
  end

  version :profile do
    process resize_to_fit: [150, 150]
  end

  version :thumb do
    process resize_to_fit: [60, 60]
  end

  CarrierWave.configure do |config|
    config.cache_storage = :file
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
