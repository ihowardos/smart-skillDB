class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [400, 400]
  end

  def default_url
    "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

end
