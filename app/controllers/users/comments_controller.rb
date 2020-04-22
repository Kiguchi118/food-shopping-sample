class Users::CommentsController < ApplicationController

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash.now[:success] = "コメントを投稿しました！"
      @comments = @comment.item.comments.order(created_at: :desc)
    else
      flash.now[:denger] = "コメントが空欄です！"
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find_by(user_id: current_user.id, id: params[:id])
    @comments = @comment.item.comments.order(created_at: :desc)
    @comment.destroy
    flash.now[:success] = "コメントを削除しました！"
  end

  private

    def comment_params
      params.require(:comment).permit(:content).merge(item_id: params[:item_id])
    end
end
