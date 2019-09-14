class UsersController < ApplicationController

  before_action :set_search

  def mypage
    @user = User.find(params[:id])
  end

  def resistration
  end
  # ダミーです
  def tell
  end
    # ダミーです
  def address
  end
    # ダミーです
  def credit
  end
    # ダミーです
  def finish
  end

  def profile_editer
  end

  def purchase
  end

  def signup
  end

  def identification
  end

  def cardselect    
  end

  def logout
  end

  def login
    @user = User.new
  end

  private
  def set_search
    @q = Item.search(params[:q])
  end
  
end
