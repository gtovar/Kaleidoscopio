class HomeController < ApplicationController
layout "front-end"

  def index
    @search = Course.search(params[:search])	
    @courses = @search.order('status').all
    @total = @courses.count
    @courses = @search.paginate(page: 1, :per_page => 8)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

	def get_next_results
    @search = Course.search(session[:search]).order('status')
		@total = @search.count
		@no_more_results = @total <= Course::RESULTS_PER_PAGE
    @courses = @search.paginate(page: params[:page], :per_page => Course::RESULTS_PER_PAGE )
    respond_to do |format|
			format.js		
		end
  end	

  def listcoursespage
    @search = Course.search(params[:search])	
    @courses = @search.order('status').all
    @total = @courses.count
    @courses = @search.paginate(page: 1, :per_page => Course::RESULTS_PER_PAGE )
    session[:search] = params[:search]

	
    respond_to do |format|
      format.html # listacursos.html.erb
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


def paginate_casinos
    @no_more_results = params[:page] ? (params[:page].to_i * Kaleydoscopio::Application::RESULTS_PER_SCROLLING >= @total_results) :
                                       (@total_results <= Kaleydoscopio::Application::RESULTS_PER_SCROLLING)
  end

def aboutus
end

def contact
end

def view_contact
end



def error
end


end
