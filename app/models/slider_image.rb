# encoding: UTF-8
class SliderImage < ActiveRecord::Base
  attr_accessible :tagline, :description, :photo, :is_from_url, :external_url, :photo_width, :photo_height

  validates :tagline, :description, :photo, :presence => true 

  validates :external_url, :presence => true, :if => Proc.new { |c| c.is_from_url }  
  validate :external_is_url
  
  mount_uploader :photo, ImageUploader
  
  def photo_height
    ::Magick::Image.open(photo.path)['height']
  end
  
  private
    
    def external_is_url
      !!URI.parse(self.external_url) unless self.external_url.nil?
      rescue URI::InvalidURIError
      false
    end

end
