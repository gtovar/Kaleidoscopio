class Contact < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :subjects, :message
end
