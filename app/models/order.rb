require 'securerandom'
class Order < ActiveRecord::Base
before_create :create_token

  belongs_to :course
  attr_accessible :payment_status, :token, :quantity
  validates :token, :uniqueness => true	
def create_token
   self.token = SecureRandom.urlsafe_base64(15)
   self.total_price = Course.find(course.id).price * self.quantity
  end


end
