class Course < ActiveRecord::Base


validates :biography_teacher, :category, :date_time, :description, :facebook_link, :google_map, :limit_class_tickets, :name, :pay_link, :photo, :place, :price, :requisites_student, :teacher_name, :presence => true



 attr_accessible :biography_teacher, :category, :date_time, :description, :facebook_link, :google_map, :limit_class_tickets, :name, :owned, :pay_link, :photo, :place, :price, :requisites_student, :teacher_name, :photo_teacher

has_many :orders


accepts_nested_attributes_for :orders  

extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

mount_uploader  :photo, ImageUploader
mount_uploader  :photo_teacher, ImageUploader



end
