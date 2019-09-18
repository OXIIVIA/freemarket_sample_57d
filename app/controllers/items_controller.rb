class ItemsController < ApplicationController
  before_action :set_item,          only: [:show, :edit, :update]
  before_action :set_item_form_collction_select, only: [:new, :edit]


  def index
    @items = Item.includes(:user)
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
    @item = Item.new
    10.times{@item.images.build}
  end

  def sell
    @category = Category.all.order("id ASC").limit(13)
  end   

  def search
      respond_to do |format|
       format.html
       format.json do
        @children = Category.find(params[:parent_id]).children
    #    #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
       end
      end
  end

  # 以下全て、formatはjsonのみ
   # 親カテゴリーが選択された後に動くアクション
   def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find(params[:parent_id]).children
 end

 # 子カテゴリーが選択された後に動くアクション
 def  get_category_grandchildren
   #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
   @category_grandchildren = Category.find(params[:child_id]).children
 end

 private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :condition_id, :region_id, :postage_id, :delivery_day_id, :delivery_way_id, :brand_id, :price, images_attributes: [:id, :image] ).merge(saler_id: current_user.id, size_id: 1)
  end

  # 出品フォームの選択肢をセット
  def set_item_form_collction_select
    @category_parent_array = Category.where(ancestry: nil)
    @brand                 = Brand.all
    @condition             = Condition.all
    @postage               = Postage.all
    @region                = Region.all
    @delivery_day          = DeliveryDay.all
    @delivery_way          = DeliveryWay.all
  end

end