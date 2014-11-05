# encoding: utf-8

class CoverUploader < FileUploader
  def self.fog_public  
   return  true
  end
  include CarrierWave::MiniMagick
  def convert_and_scale
    manipulate! do |img|
      img.format 'jpeg'
      img.resize '175x200'
      img
    end
  end  
  version :thumb do
    process :convert_and_scale
  end
end
