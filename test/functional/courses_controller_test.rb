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
      post :create, course: { Facebook_link: @course.Facebook_link, Kaleyoscopio_class: @course.Kaleyoscopio_class, biography_teacher: @course.biography_teacher, category: @course.category, date_time: @course.date_time, description: @course.description, google_map: @course.google_map, limt_class_tickets: @course.limt_class_tickets, name: @course.name, photo: @course.photo, place: @course.place, price_link: @course.price_link, requisites_student: @course.requisites_student, teacher_name: @course.teacher_name, teaser: @course.teaser }
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
    put :update, id: @course, course: { Facebook_link: @course.Facebook_link, Kaleyoscopio_class: @course.Kaleyoscopio_class, biography_teacher: @course.biography_teacher, category: @course.category, date_time: @course.date_time, description: @course.description, google_map: @course.google_map, limt_class_tickets: @course.limt_class_tickets, name: @course.name, photo: @course.photo, place: @course.place, price_link: @course.price_link, requisites_student: @course.requisites_student, teacher_name: @course.teacher_name, teaser: @course.teaser }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
