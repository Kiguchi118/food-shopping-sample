class Users::ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  before_action :set_item, only:[:show,:edit,:update]

  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page]).per(20)
  end

  def show
    @cart_item = CartItem.new
    @like_count = Like.where(item_id: @item.id).count
    @comment = Comment.new
    @comments = @item.comments.order(created_at: :desc)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, flash: { success: "商品を追加できました。"}
    else
      render 'new'
    end
  end

  def edit 
  end

  def update
  end

  def destroy
  end

  private
    def item_params
      params.require(:item).permit(:name,:introduction,
                    :genre_id,:price,:sales_status,:picture)
    end

    def set_item
      @item = Item.find(params[:id])
    end
end
