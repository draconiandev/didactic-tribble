# encoding: utf-8
class CoverUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # process convert: 'png'

  version :card do
    process resize_to_fill: [363, 363]
  end

  version :cover do
    process resize_to_fill: [1600, 400]
  end
end
