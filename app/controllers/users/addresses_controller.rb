class Users::AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [:edit, :update]

  def index
    @address = Address.new
    @addresses = Address.where(user_id: current_user.id)
    @user = current_user
  end

  def create
    @address = current_user.addresses.build(address_params)
    @address.name = current_user.last_name
    if @address.save
      redirect_to addresses_url, flash: { success: "住所を登録できました！" }
    else
      @addresses = Address.where(user_id: current_user.id)
      @user = current_user
      render "index"
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to addresses_url, flash: { success: "登録していた住所を編集しました！"}
    else
      render "edit"
    end
  end

  def destroy
    Address.find(params[:id]).destroy
    redirect_to addresses_url, flash: { success: "登録していた住所を削除しました" }
  end

  private

    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:postcode,:prefecture_name,:address)
    end
end
