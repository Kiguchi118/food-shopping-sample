class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only:[:edit,:update]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "新しい商品を登録できました"
      redirect_to items_url
    else
      render 'new'
    end
  end

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
