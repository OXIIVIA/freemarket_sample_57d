class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @item=Item.new
    
  end
  
  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to root_path

    # if @item.save
    #   # binding.pry
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end

  
  private
  
  def item_params
    params.require(:item).permit(
      :name, 
      :description,
      :postage, 
      :price, 
      :condition, 
      :size, 
      :image,
      :deliver_date,
      :prefecture_id,
      :category_id,
      :id,
      :size,
      :group_id,
      :saler_id,
      :buyer_id,
      
      
    )  
  end

  # def set_product
  #   @item = Item.find(params[:id])
  #  end

  end

