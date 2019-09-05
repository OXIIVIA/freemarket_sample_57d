class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def sell
    @item=Item.new
  end
  
end
