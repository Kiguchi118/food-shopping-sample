class Users::AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_addresses, only: [:index]

  def index
  end

  def create
    address = current_user.addresses.build(address_params)
    if address.save
      redirect_to addresses_url, flash: { success: "住所を登録できました！" }
    else
      set_addresses
      render "index"
    end
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private

    def set_addresses
      @new_address = Address.new
      @addresses = Address.where(user_id: current_user.id)
      @user = current_user
    end

    def address_params
      params.require(:address).permit(:postcode,:prefecture_name,
                      :address_city,:address_street,:address_building)
    end
end
