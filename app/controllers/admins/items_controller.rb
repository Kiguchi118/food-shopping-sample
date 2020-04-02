class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only:[:show,:edit,:update]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "新しい商品を登録できました"
      redirect_to admins_items_url
    else
      flash.now[:danger] = "正しく商品を登録することができませんでした"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:success] = "商品を更新することができました"
      redirect_to admins_item_url(@item)
    else
      flash.now[:danger] = "正しく商品を更新することができませんでした"
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
