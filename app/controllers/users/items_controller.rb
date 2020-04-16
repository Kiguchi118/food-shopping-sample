class Users::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(20)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @like_count = Like.where(item_id: @item.id).count
  end
end
