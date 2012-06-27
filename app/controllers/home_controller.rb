class HomeController < ApplicationController
layout "front-end"

  def index
    @courses = Course.paginate(page: params[:page])
    @search = Course.search(params[:search])	
    @courses = @search.order('category').all
    @total = @courses.count

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
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


end
