class Users::CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.save
    @item = Item.find(@comment.item_id)
    @comments = @item.comments.order(created_at: :desc)
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find_by(user_id: current_user.id, id: params[:id])
    @item = Item.find(@comment.item_id)
    @comment.destroy
    @comments = @item.comments.order(created_at: :desc)
  end

  private

    def comment_params
      params.require(:comment).permit(:content).merge(item_id: params[:item_id])
    end
end
