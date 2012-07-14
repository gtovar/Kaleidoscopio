class Course < ActiveRecord::Base

attr_accessible :end_time, :biography_teacher, :category, :date_time, :description, :google_map, :limit_class_tickets, :name, :owned, :photo, :place, :price, :requisites_student, :teacher_name, :photo_teacher

  CATEGORIES = ['arte', 'culinarias', 'empresariales', 'estilo_de_vida', 'tecnologia']
  
  class << self
    CATEGORIES.each do |category_name|
      define_method "cat_#{category_name}" do
        category_name
      end
    end
	end 

validates :end_time, :biography_teacher, :category, :date_time, :description, :google_map, :limit_class_tickets, :name, :photo_teacher, :photo, :place, :price, :requisites_student, :teacher_name, :presence => true

  has_many :orders

  accepts_nested_attributes_for :orders  

  extend FriendlyId
    friendly_id :name, use: [:slugged, :history]

  mount_uploader  :photo, ImageUploader
  mount_uploader  :photo_teacher, ImageUploader

end
