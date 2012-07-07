class OrdersController < ApplicationController
 layout "front-end-waiting"
  
    
  before_filter :get_course

  def get_course
    @course = Course.find(params[:course_id])
  end	

  
  
  
 def new
	@order = @course.order.build
 end

  def create 	
	@order = @course.orders.create(params[:order])
	
	respond_to do |format|
      	if @order.save
        	format.html { redirect_to course_order_path(@course,@order) }
        	
      	else
        end
        end	
      	
		
  end



	
  def send_orden
	@order=Order.find(params[:id])
	respond_to do |format|
      		format.html # send_orden.html.erb
      		format.json { render json: @order }
    	end
  end

def show
  @order=Order.find(params[:id])
	respond_to do |format|
      		format.html # send_orden.html.erb
      		format.json { render json: @order }
    	end

end


end
