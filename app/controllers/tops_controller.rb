class TopsController < ApplicationController
  def index
    @items = Item.first(3)
  end
end
