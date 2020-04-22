class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :forbid_test_user, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "登録情報を更新しました"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to new_user_session_path
  end

  private

    def user_params
      params.require(:user).permit(
        :name,:email,:password,:password_confirmation,:last_name,:first_name,
        :last_name_kana,:first_name_kana,:postcode,:prefecture_name,:address,
        :telephone_number
      )
    end

    def set_user
      @user = User.find(params[:id])
    end

    def correct_user
      if current_user.id != @user.id
        redirect_to user_path(current_user)
      end
    end

    def forbid_test_user
      if current_user.email == "test@example.com"
        redirect_to root_url, flash: { denger: "テストユーザのため変更することはできません" }
      end
    end
end
