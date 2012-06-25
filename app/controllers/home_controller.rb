class HomeController < ApplicationController
  def index
    @courses = Course.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

  def show_detail_course_to_users

 @course = Course.find(params[:id])

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
