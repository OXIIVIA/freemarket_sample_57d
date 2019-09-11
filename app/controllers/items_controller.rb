class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: :show
  before_action :set_seler, only: :show

  def index
  end

  def show
  end

  def new
    @item=Item.new 
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
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
      :buyer_id,
    ).merge(saler_id: current_user.id)
  end

  def set_product
    @item = Item.find(params[:id])
  end

  def set_seler
    @user = User.find(@item.saler_id)
  end


end

