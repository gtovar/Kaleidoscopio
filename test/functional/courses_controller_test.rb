require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { biography_teacher: @course.biography_teacher, category: @course.category, date_time: @course.date_time, description: @course.description, facebook_link: @course.facebook_link, google_map: @course.google_map, limit_class_tickets: @course.limit_class_tickets, name: @course.name, owned: @course.owned, pay_link: @course.pay_link, photo: @course.photo, place: @course.place, price: @course.price, requisites_student: @course.requisites_student, teacher_name: @course.teacher_name }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course
    assert_response :success
  end

  test "should update course" do
    put :update, id: @course, course: { biography_teacher: @course.biography_teacher, category: @course.category, date_time: @course.date_time, description: @course.description, facebook_link: @course.facebook_link, google_map: @course.google_map, limit_class_tickets: @course.limit_class_tickets, name: @course.name, owned: @course.owned, pay_link: @course.pay_link, photo: @course.photo, place: @course.place, price: @course.price, requisites_student: @course.requisites_student, teacher_name: @course.teacher_name }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
