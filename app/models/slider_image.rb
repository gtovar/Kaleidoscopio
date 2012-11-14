# encoding: UTF-8
class SliderImage < ActiveRecord::Base
  attr_accessible :tagline, :description, :photo, :is_from_url, :external_url

  validates :tagline, :description, :photo, :presence => true 

  validates :external_url, :presence => true, :if => Proc.new { |c| c.is_from_url }  
  validate :external_is_url
  
  mount_uploader :photo, ImageUploader
  
  private
    
    def external_is_url
      !!URI.parse(self.external_photo) unless self.external_url.nil?
      rescue URI::InvalidURIError
      false
    end

end
