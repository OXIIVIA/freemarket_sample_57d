class ItemsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_product, only: :show

  def index
  end

  def show
    @user = User.find(@item.saler_id)
  end

  def new
    @item=Item.new
    
  end
  
  def create
    @item = Item.new(item_params)
  #   if params[:img] != nil
  #     img = MiniMagick::Image.read(params[:img])
  #     img.resize_to_fill "128x128"
  #     img.write "public/images/hoge.jpg"
  #  end
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

  end

