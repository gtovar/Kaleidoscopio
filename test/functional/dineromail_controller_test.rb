require 'test_helper'

class DineromailControllerTest < ActionController::TestCase
  test "should get ipn" do
    get :ipn
    assert_response :success
  end

end
