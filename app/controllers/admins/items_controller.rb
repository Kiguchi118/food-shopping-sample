class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only:[:edit,:update]

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:success] = "商品を編集することができました"
      redirect_to @item
    else
      render "edit"
    end
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :introduction,
                  :genre_id, :price, :sales_status, :picture)
    end

end
