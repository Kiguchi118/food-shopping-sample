class Users::OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new
    @addresses = Address.where(user_id: current_user.id)
  end

  def storage
    session[:order] = Order.new()
    session[:order][:user_id] = current_user.id
    session[:order][:payment_method] = params[:order][:payment_method]
    session[:order][:total_payment] = product_price_calculation(current_user.cart_items) + session[:order][:shipping_cost]

    if params[:order][:select_address] == "self"
      session[:order][:postcode] = current_user.postcode
      session[:order][:prefecture_name] = current_user.prefecture_name
      session[:order][:address_city] = current_user.address_city
      session[:order][:address_street] = current_user.address_street
      session[:order][:address_building] = current_user.address_building
      session[:order][:name] = current_user.first_name

    elsif params[:order][:select_address] == "registered"
      address = Address.find(params[:order][:exis_address_id])
      session[:order][:postcode] = address.postcode
      session[:order][:prefecture_name] = address.prefecture_name
      session[:order][:address_city] = address.address_city
      session[:order][:address_street] = address.address_street
      session[:order][:address_building] = address.address_building
      session[:order][:name] = address.name

    elsif params[:order][:select_address] == "new"
      session[:order][:postcode] = params[:order][:postcode]
      session[:order][:prefecture_name] = params[:order][:prefecture_name]
      session[:order][:address_city] = params[:order][:address_city]
      session[:order][:address_street] = params[:order][:address_street]
      session[:order][:address_building] = params[:order][:address_building]
      session[:order][:name] = current_user.first_name
    
    end
    redirect_to confirm_orders_url
  end

  def create
    order = Order.new(session[:order])
    current_user.cart_items.each do |cart_item|
      order.order_details.build(
        item_id: cart_item.item.id,
        amount: cart_item.amount,
        purchase_price: cart_item.item.price
      )
    end
    order.save
    current_user.cart_items.destroy_all
    redirect_to complete_orders_url
  end

  def confirm
    @cart_items = current_user.cart_items
    @total_amount = 0
    @payment_status = session[:order]["payment_method"]
  end

  def complete
    session[:order].clear
  end

  def index
  end

  def show
  end

  private

    # 購入商品の合計金額計算(送料なし)
    def product_price_calculation(cart_items)
        total = 0
        cart_items.each do |cart_item|
            total += (cart_item.item.price * 1.1).round * cart_item.amount
        end
        return total
    end
end
