class HomeController < ApplicationController
layout "front-end"

  def index
    @search = Course.search(params[:search])	
    @courses = @search.order('status').all
    @total = @courses.count
    @courses = @search.paginate(page: params[:page], :per_page => 4)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end



  def listcoursespage
    @search = Course.search(params[:search])	
    @courses = @search.order('status').all
    @total = @courses.count
    @courses = @search.paginate(page: params[:page], :per_page => 4)
	
    respond_to do |format|
      format.html # listacursos.html.erb
      format.json { render json: @courses }
      format.js
    end
  end

  def show_detail_course_to_users
 
    @course = Course.find(params[:id])
    @order = @course.orders(params[@course])	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
   	
  end

def aboutus
end

def terms
end

def contact
end

def view_contact
end

def succes
end

def error
end


end
