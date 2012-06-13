class Course < ActiveRecord::Base
  attr_accessible :Facebook_link, :Kaleyoscopio_class, :biography_teacher, :category, :date_time, :description, :google_map, :limt_class_tickets, :name, :photo, :place, :price_link, :requisites_student, :teacher_name, :teaser
end
