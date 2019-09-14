class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_search
  before_action :set_product, only: [:show, :edit, :update]
  before_action :set_seler, only: :show 
  before_action :correct_user, only: [:edit, :update]

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)

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

  def search
    @q = Item.ransack(search_params)
    @items = @q.result(distinct: true)
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

  def search_params
    params.require(:q).permit(:name_cont)
  end

  def set_search
    @q = Item.search(params[:q])
  end

  def correct_user
    @item = Item.find(params[:id])
    if @item.saler_id != current_user.id
      redirect_to root_path
    end
  end


end

