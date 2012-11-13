# encoding: UTF-8
class SliderImage < ActiveRecord::Base
  attr_accessible :tagline, :description, :photo, :is_from_url, :external_photo

  validates :tagline, :description, :presence => true 
  validates :photo, :presence => true, :unless => Proc.new { |c| c.is_from_url }
  validates :external_photo, :presence => true, :if => Proc.new { |c| c.is_from_url }  
  validate :external_photo_should_be_url
  
  mount_uploader :photo, ImageUploader
  
  before_create :set_image_info
  
  private
  
    def set_image_info
      if self.is_from_url
        self.photo = nil
      else
        self.external_photo = nil
      end
    end
    
    def external_photo_should_be_url
      URI.parse(self.external_photo) unless self.external_photo.nil?
      rescue URI::InvalidURIError
        errors.add(:external_photo, "No es un URL válido")
        return false
      end
    end

end
