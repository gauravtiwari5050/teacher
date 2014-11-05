# encoding: utf-8

class PdfUploader < FileUploader
  def self.fog_public  
   return  true
  end
  def filename
    "#{model.uniq_id}.pdf"     
  end
end
