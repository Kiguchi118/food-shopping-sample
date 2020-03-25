class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:edit, :update]

  def index
    @users = User.with_deleted
  end

  def show
    @user = User.with_deleted.find(params[:id])
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "ユーザー登録情報を更新しました"
      redirect_to admins_users_url
    else
      render "edit"
    end
  end

  def destroy

  end

  private

    def user_params
      params.require(:user).permit(
        :name,:email,:password,:password_confirmation,:last_name,:first_name,
        :last_name_kana,:first_name_kana,:postcode,:prefecture_name,:address_city,
        :address_street,:address_building,:telephone_number
      )
    end

    def set_user
      @user = User.find(params[:id])
    end

end
