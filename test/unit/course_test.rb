# == Schema Information
#
# Table name: courses
#
#  id                 :integer          not null, primary key
#  classname          :string(255)
#  category           :string(255)
#  description        :text
#  photo              :string(255)
#  teachername        :string(255)
#  bioteacher         :text
#  place              :string(255)
#  googlemap          :text
#  date               :datetime
#  requisitesstudent  :text
#  price              :string(255)
#  linkay             :string(255)
#  limitclasstickets  :integer
#  linkFacebook       :string(255)
#  Kaleydoscopioclass :boolean
#  teaser             :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
