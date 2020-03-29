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

  end

  def destroy

  end

  private

    def cart_item_params
      params.require(:cart_item).permit(:user_id,:item_id,:amount)
    end
end
