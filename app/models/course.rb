class Course < ActiveRecord::Base
validates :biography_teacher, :category, :date_time, :description, :facebook_link, :google_map, :limit_class_tickets, :name, :owned, :pay_link, :photo, :place, :price, :requisites_student, :teacher_name, :presence => true
 attr_accessible :biography_teacher, :category, :date_time, :description, :facebook_link, :google_map, :limit_class_tickets, :name, :owned, :pay_link, :photo, :place, :price, :requisites_student, :teacher_name
end
