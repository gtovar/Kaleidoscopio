class Course < ActiveRecord::Base

attr_accessible :requisites_student, :end_time, :biography_teacher, :category, :date_time, :description, :google_map, :limit_class_tickets, :name, :owned, :photo, :place, :price, :teacher_name, :photo_teacher
before_create :create_status
  CATEGORIES = ['arte', 'culinarias', 'empresariales', 'estilo_de_vida', 'tecnologia']

  class << self
    CATEGORIES.each do |category_name|
      define_method "cat_#{category_name}" do
        category_name
      end
    end
  end

  def create_status
      self.status = "abierto"
  end

  RESULTS_PER_PAGE = 6


validates :end_time, :biography_teacher, :category, :date_time, :description, :google_map, :limit_class_tickets, :name, :place, :price, :teacher_name, :photo_teacher, :photo, :presence => true


  has_many :orders, :dependent => :destroy

  accepts_nested_attributes_for :orders

  extend FriendlyId
    friendly_id :name, use: [:slugged, :history]

  mount_uploader  :photo, ImageUploader
  mount_uploader  :photo_teacher, ImageUploader

end
