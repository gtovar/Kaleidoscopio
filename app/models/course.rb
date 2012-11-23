class Course < ActiveRecord::Base

  attr_accessible :requisites_student, :end_time, :biography_teacher, :category, :date_time, :description, :google_map, :limit_class_tickets, :name, :owned, :photo, :place, :price, :teacher_name, :photo_teacher, :more_than_one_session, :wont_be_bought, :finish_time, :schedule_info, :go_to_info 
  before_create :set_status
  before_create :set_date_and_price_info

  CATEGORIES = ['arte', 'culinarias', 'empresariales', 'estilo_de_vida', 'tecnologia']

  class << self
    CATEGORIES.each do |category_name|
      define_method "cat_#{category_name}" do
        category_name
      end
    end
  end


  RESULTS_PER_PAGE = 6


validates :biography_teacher, :category, :date_time, :description, :google_map, :limit_class_tickets, :name, :place, :teacher_name, :photo_teacher, :photo, :presence => true

  validates :finish_time, :schedule_info, :presence => true, :if => Proc.new { |c| c.more_than_one_session }
  validates :end_time, :presence => true, :unless => Proc.new { |c| c.more_than_one_session }  
  
  validates :go_to_info, :presence => true, :if => Proc.new { |c| c.wont_be_bought }
  validates :price, :presence => true, :unless => Proc.new { |c| c.wont_be_bought }  
  
  validates_datetime :finish_time, :after => :date_time

  has_many :orders, :dependent => :destroy

  accepts_nested_attributes_for :orders

  extend FriendlyId
    friendly_id :name, use: [:slugged, :history]

  mount_uploader  :photo, ImageUploader
  mount_uploader  :photo_teacher, ImageUploader
  
  after_find do |course|
    course.set_status
    course.save
  end
  
  def has_finished?
    self.more_than_one_session ? (self.finish_time < Time.now.in_time_zone('Mexico City')) : (self.date_time < Time.now.in_time_zone('Mexico City'))
  end
  
  def is_sold_out?
		suma = self.orders.where(:payment_status => 'success').sum(:quantity)
		self.limit_class_tickets - suma <= 0
  end
  
  def set_status
    unless self.has_finished?
      if self.is_sold_out?
        self.status = "agotado"
      else
        self.status = "abierto"
      end
    else
      self.status = "terminado"
    end
  end
  
  private
  
    def set_date_and_price_info
      if self.more_than_one_session
        self.end_time = nil
      else
        self.finish_time = nil
        self.schedule_info = nil
      end
      
      if self.wont_be_bought
        self.price = nil
      else
        self.go_to_info = nil
      end
    end

end
