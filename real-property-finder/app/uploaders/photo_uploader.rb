class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader
  storage :fog

  # Override the directory where uploaded files will be stored.
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded
  # def default_url(*args)
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded
  # process resize_to_fit: [800, 800]

  # Create different versions of your uploaded files
  version :thumb do
    process :resize_to_fit => [50, 50]
  end

  # version :small_thumb, from_version: :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded
  def extension_white_list
    %w[jpg jpeg gif png]
  end
end
