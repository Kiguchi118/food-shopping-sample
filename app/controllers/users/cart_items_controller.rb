class Users::CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_items, only:[:index]

  def index
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      flash[:success] = "カートに商品を入れました"
      redirect_to cart_items_url
    else
      @item = Item.find(params[:cart_item][:item_id])
      unless CartItem.find_by(user_id: params[:cart_item][:user_id],item_id: @item.id).nil?
        flash.now[:warning] = "この商品は既にお客様のカートに入れてあります"
      end
      render "users/items/show"
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(cart_item_params)
      flash[:success] = "#{cart_item.item.name}の数量を変更しました"
      redirect_to cart_items_url
    else
      flash.now[:danger] = "商品の数量を入力してください"
      set_cart_items
      render "index"
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    flash[:success] = "#{cart_item.item.name}をカートから削除しました"
    redirect_to cart_items_url
  end

  def clear
    CartItem.where(user_id: current_user.id).destroy_all
    flash[:success] = "カートを空にしました"
    redirect_to cart_items_url
  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:user_id,:item_id,:amount)
    end

    def set_cart_items
      @cart_items = CartItem.where(user_id: current_user.id)
      @total_price = 0
      @total_amount = 0
    end
end
