class Course < ActiveRecord::Base
extend FriendlyId
  friendly_id :name, use: [:slugged, :history]


validates :photo_teacher,:biography_teacher, :category, :date_time, :description, :facebook_link, :google_map, :name, :owned, :pay_link, :photo, :place, :price, :requisites_student, :teacher_name, :presence => true
 attr_accessible :photo_teacher,:biography_teacher, :photo, :category, :date_time, :description, :facebook_link, :google_map, :limit_class_tickets, :name, :owned, :pay_link, :place, :price, :requisites_student, :teacher_name

mount_uploader  :photo, ImageUploader
mount_uploader  :photo_teacher, ImageUploader


end
