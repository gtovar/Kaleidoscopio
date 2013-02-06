class HomeController < ApplicationController
  layout "front-end"

  def index
    # @course = Course.first
    @search = Course.search(params[:search])
    @courses = @search.order("date_time ASC").limit(10)

    @courses = @courses.select { |c| c.status == "abierto" }
    @slider_images = SliderImage.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  def get_next_results
    @course = nil

    @search = Course.search(session[:search])
    @courses = @search.paginate(:page => params[:page], :per_page =>Course::RESULTS_PER_PAGE)
    @courses = @courses.select { |c| c.status == "abierto" }

    @prueba = params[:page]
    @no_more_results= @courses.total_pages == @prueba.to_i
    respond_to do |format|
      format.js
    end
  end

  def listcoursespage
    @course = nil

    @search = Course.search(params[:search])
    @courses = @search.paginate(:page => 1, :per_page => Course::RESULTS_PER_PAGE )
    @courses = @courses.select { |c| c.status == "abierto" }

    session[:search] = params[:search]
    respond_to do |format|
      format.html # listacursos.html.erb
      format.json { render json: @courses }
    end
  end

  def show_detail_course_to_users
    @course = nil

    @course = Course.find(params[:id])
    @order = @course.orders(params[@course])
    @suma = @order.where(:payment_status => 'success').sum(:quantity)
    @disponibles= @course.limit_class_tickets	- @suma
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end

  end

  def aboutus
    @course = nil
  end

  def contact
    @course = nil
  end

  def view_contact
    @course = nil
  end


  def error
    @course = nil
  end
end
