# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  process :store_dimensions

  include CarrierWave::MiniMagick

  # storage :file
  storage :aws

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :card do
    process resize_to_fill: [363, 363]
  end

  version :medium do
    process resize_to_fill: [800, 800]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    original_filename
  end

  private

  def store_dimensions
    if file && model
      model.width, model.height = ::MiniMagick::Image.open(file.file)[:dimensions]
    end
  end
end
