class Users::CartItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = CartItem.where(user_id: current_user.id)
    @total_price = 0
    @total_amount = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      flash[:success] = "カートに商品を入れました"
      redirect_to cart_items_url
    else
      @item = Item.find(params[:id])
      render "items/show"
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    flash[:success] = "数量を変更しました"
    redirect_to cart_items_url
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
end
