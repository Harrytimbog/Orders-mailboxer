class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      OrderMailer.with(order: @order).new_order_email.deliver_later

      flash[:success] = t('flash.order.success')
      redirect_to root_path, notice: 'Order was successfully sent'
    else
      flash.now[:error] = t('flash.order.error_html')
      render :new, notice: 'something went wrong'
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :phone, :message)
  end
end
