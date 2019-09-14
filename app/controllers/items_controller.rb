class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :purchase, :pay]
  before_action :set_seler, only: :show 

  require 'payjp'


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
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    card = current_user.card
    customer = Payjp::Customer.retrieve(card.customer_id)
    @card_information = customer.cards.retrieve(card.card_id)
    @exp_month = @card_information.exp_month.to_s
    @exp_year = @card_information.exp_year.to_s.slice(2,3)
  end

  def pay
    @card = current_user.card
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    charge = Payjp::Charge.create(
    amount: @item.price,
    customer: @card.customer_id,
    currency: 'jpy'
    )
    if @item.update(buyer_id: current_user.id) 
      redirect_to action: :index
    else
      redirect_to action: :purchase
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

