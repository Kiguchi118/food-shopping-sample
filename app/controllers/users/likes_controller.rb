class Users::LikesController < ApplicationController
    before_action :authenticate_user!

    def index
        @like_items = current_user.like_items.page(params[:page]).per(20)
    end

    def create
        @like = current_user.likes.build(item_id: params[:item_id])
        @like.save
        @item = Item.find(@like.item_id)
        @like_count = Like.where(item_id: params[:item_id]).count
    end

    def destroy
        @like = Like.find_by(user_id: current_user.id, item_id: params[:item_id])
        @item = Item.find(@like.item_id)
        @like.destroy
        @like_count = Like.where(item_id: params[:item_id]).count
    end
    
end
