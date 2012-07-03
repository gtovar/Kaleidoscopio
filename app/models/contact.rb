class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :subjects, :message
validates :email, :name, :phone, :subjects, :message,:presence => true

end
