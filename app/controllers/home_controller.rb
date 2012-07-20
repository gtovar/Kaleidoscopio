class HomeController < ApplicationController
layout "front-end"

  def index
    @search = Course.search(params[:search])	
    @courses = @search.order(:status).limit(10)   

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
  end

	def get_next_results
    @search = Course.search(session[:search])  			
    @courses = @search.order(:status).paginate(:page => params[:page], :per_page =>Course::RESULTS_PER_PAGE)
		@prueba = params[:page] 
		 @no_more_results= @courses.total_pages == @prueba.to_i
    respond_to do |format|
			format.js		
		end
  end	

  def listcoursespage
    @search = Course.search(params[:search])
    @courses = @search.order(:status).paginate(:page => 1, :per_page => Course::RESULTS_PER_PAGE )
    session[:search] = params[:search]
    respond_to do |format|
      format.html # listacursos.html.erb
      format.json { render json: @courses }
    end
  end

  def show_detail_course_to_users
 
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
end

def contact
end

def view_contact
end


def error
end


end
