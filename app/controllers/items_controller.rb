class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :purchase]
  before_action :set_seler, only: :show 

  def index    
    @items =Item.order("created_at DESC").limit(4)
  end

  def show
  end

  def new
    @item=Item.new 
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "商品を削除しました"
      redirect_to mypage_path(current_user)
    else
      flash[:notice] = "商品の削除に失敗しました"
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.saler_id == current_user.id
      @item.destroy
      redirect_to mypage_path(current_user)
    else
      render :show
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "商品を編集しました"
      redirect_to mypage_path(current_user)
    else
      render 'items/edit'
    end
  end

  def purchase
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

