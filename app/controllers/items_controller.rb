class ItemsController < ApplicationController
  def index
    @category = Category.all
    @parents = @category.where(ancestry: nil)
    @products = Product.all
  end

  def new
    @parents = Category.all.order("id ASC").limit(13)
  end  

  def show
  end

  def sell
  end
end
