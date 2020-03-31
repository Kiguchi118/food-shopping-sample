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

  end

  def comfirm

  end

  def complete

  end

  def index
  end

  def show
  end
end
