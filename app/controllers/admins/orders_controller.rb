class Admins::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    if params[:order_status_commit]
      order.update(order_params)
    elsif params[:production_status_commit]
      OrderDetail.find(params[:order_detail][:id]).update(order_detail_params)
    else
      render "show"
    end
    redirect_to admins_orders_url, flash: { success: "ステータスを更新しました" }
  end

  private

    def order_params
      params.require(:order).permit(:order_status)
    end

    def order_detail_params
      params.require(:order_detail).permit(:production_status)
    end

end
