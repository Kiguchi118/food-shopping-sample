class Users::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_orders, only:[:new]

  def new
  end

  def storage
    if params[:order][:payment_method].nil?
      flash.now[:danger] = "支払い方法を選択してください"
      set_orders
      render "new"
    else
      session[:order] = Order.new
      session[:order][:user_id] = current_user.id
      session[:order][:payment_method] = params[:order][:payment_method]
      session[:order][:total_payment] = product_price_calculation(current_user.cart_items) + session[:order][:shipping_cost]
      session[:select_address] = params[:order][:select_address]

      if session[:select_address] == "self"
        session[:order][:postcode] = current_user.postcode
        session[:order][:prefecture_name] = current_user.prefecture_name
        session[:order][:address] = current_user.address
        session[:order][:name] = current_user.last_name

      elsif session[:select_address] == "registered"
        address = Address.find(params[:order][:exis_address_id])
        session[:order][:postcode] = address.postcode
        session[:order][:prefecture_name] = address.prefecture_name
        session[:order][:address] = address.address
        session[:order][:name] = address.name

      elsif session[:select_address] == "new"
        session[:address] = Address.new
        session[:order][:postcode] = session[:address][:postcode] = params[:order][:postcode]
        session[:order][:prefecture_name] = session[:address][:prefecture_name] = params[:order][:prefecture_name]
        session[:order][:address] = session[:address][:address] = params[:order][:address]
        session[:order][:name] = session[:address][:name] = current_user.last_name
      
      end
      redirect_to confirm_orders_url
    end
  end

  def create
    if session[:select_address] == "new"
      address = current_user.addresses.build(session[:address])
      address.save
    end
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

  def cancel
    session[:order].clear
    redirect_to root_url, flash: { success: "注文を中断しました" }
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

    def set_orders
      @order = Order.new
      @addresses = Address.where(user_id: current_user.id)
    end

end
