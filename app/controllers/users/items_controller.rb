class Users::ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show]
  before_action :set_item, only:[:show,:edit,:update,:destroy]
  before_action :correct_user, only:[:edit,:update,:destroy]

  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page]).per(10)
    @genres = Genre.all
  end

  def show
    @cart_item = CartItem.new
    @like_count = Like.where(item_id: @item.id).count
    @comment = Comment.new
    @comments = @item.comments.order(created_at: :desc)
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to @item, flash:{success: "商品を追加できました。"}
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, flash:{success: "商品を編集できました。"}
    else
      render "edit"
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private
    def item_params
      params.require(:item).permit(:name,:introduction,
                    :genre_id,:price,:sales_status,:picture)
    end

    def set_item
      @item = Item.find(params[:id])
    end

    def correct_user
      if current_user.id != @item.user_id
        redirect_to @item, flash:[danger: "他のユーザの商品は編集できません。"]
      end
    end
end
