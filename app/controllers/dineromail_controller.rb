class DineromailController < ApplicationController
  def ipn
	notifications = Dineromail::Notification.parse(params[:NOTIFICACION])
    	notifications.each do |notify|
      	if notify.valid_report? && notify.completed?
        	@order = Order.where("token = ?", notify.transaction_id)
        	#Allways check the amount
        	@order.payment_status = @order.total_price == notify.amount ? 'success' : 'failure'
        	@order.save
      	end
   	end
    render :nothing => true, :status =>200
  end


end
