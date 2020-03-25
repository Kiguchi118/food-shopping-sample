class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @items = Item.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
