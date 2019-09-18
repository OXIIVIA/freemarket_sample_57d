class ItemsController < ApplicationController

  before_action :set_search
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :purchase, :pay]
  before_action :set_seler, only: :show 
  before_action :set_payjp_api, only: [:purchase, :pay]
  before_action :access_check, only: [:edit, :update]
  before_action :set_item,          only: [:show, :edit, :update]
  before_action :set_item_form_collction_select, only: [:new, :edit]

  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
    @items =Item.order("created_at DESC").limit(4)
  end

  def show
    @saler_items = Item.where(saler_id: @item.saler_id).limit(6).order('created_at DESC')
    @same_category_items = Item.where(category_id: @item.category_id).limit(6).order('created_at DESC')
  end

  def create
    @item = Item.new(item_params)
    @parents = Category.where(ancestry: nil)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def new
    @item=Item.new 
  end
  
  def create
    @item = Item.new(item_params)

    if @item.valid?
      @item.save
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
    card = current_user.card
    customer = Payjp::Customer.retrieve(card.customer_id)
    @card_information = customer.cards.retrieve(card.card_id)
    @exp_month = @card_information.exp_month.to_s
    @exp_year = @card_information.exp_year.to_s.slice(2,3)
    @edited_address_number = "#{current_user.address.address_number.slice(0,3)}-#{current_user.address.address_number.slice(3,7)}"
  end

  def pay
    @card = current_user.card
    charge = Payjp::Charge.create(
    amount: @item.price,
    customer: @card.customer_id,
    currency: 'jpy'
    )
    if @item.buyer_id == nil && @item.saler_id != current_user.id
      @item.update(buyer_id: current_user.id) 
      redirect_to items_path
    else
      redirect_to purchase_items_path(@item)
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


  def set_payjp_api
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
  end
    
  def search_params
    params.require(:q).permit(:name_cont)
  end

  def set_search
    @q = Item.search(params[:q])
  end

  def access_check
    if @item.saler_id != current_user.id
      redirect_to root_path
    end
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def  get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def set_item_form_collction_select
    @category_parent_array = Category.where(ancestry: nil)
  end

end
