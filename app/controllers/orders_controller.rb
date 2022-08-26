class OrdersController < ApplicationController
  # before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(params.require(:order).permit(:name, :phone, :address, :delivery_date, :product_id, :payment_option, :amount, :order_status))

    if @order.save
      redirect_to orders_path, :notice=> 'Order was successfully created.'
    else
      redirect_to new_order_path, :alert=> 'Error! Please try again'
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    @order = Order.find(params[:id])

    if @order.update(params.require(:order).permit(:name, :phone, :address, :delivery_date, :product_id, :payment_option, :amount, :order_status))
      redirect_to orders_path, :notice=> 'Order was successfully updated.'
    else
      redirect_to new_order_path, :alert=> 'Error! Please try again'
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      redirect_to orders_path, :notice => 'Order was successfully deleted.'
    else
      redirect_to orders_path, :alert => 'Error! Please try again'
    end
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_order
  #     @order = Order.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def order_params
  #     params.require(:order).permit(:name, :phone, :address, :delivery_date, :product_id, :payment_option, :amount, :order_status)
  #   end
end
