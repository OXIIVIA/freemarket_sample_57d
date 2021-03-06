class SignupController < ApplicationController
  require "payjp"

  def step1
    @user=User.new
  end

  def step1_create
    @user = User.new(user_params)
    session[:userparams] = user_params
    if @user.valid?
      redirect_to step2_signup_index_path
    else
      render :step1
    end
  end
  
  def step2
    @user=User.new
  end

  def step2_create
    session[:phone_number] = user_params[:phone_number]
    redirect_to step3_signup_index_path
  end

  def step3
    @address = Address.new
  end

  def step3_create
    @address = Address.new(address_params)
    session[:address_params] = address_params
    if @address.valid?
      redirect_to step4_signup_index_path
    else
      render :step3
    end
  end

  def step4
  end

  def step4_create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    if params['payjp-token'].blank?
      redirect_to action: "step4"
    else
      @user=User.new(
        nickname: session[:userparams]["nickname"],
        email: session[:userparams]["email"],
        password: session[:userparams]["password"],
        password_confirmation: session[:userparams]["password_confirmation"],
        last_name: session[:userparams]["last_name"],
        first_name: session[:userparams]["first_name"],
        last_name_kana: session[:userparams]["last_name_kana"],
        first_name_kana: session[:userparams]["first_name_kana"],
        birthdate_year: session[:userparams]["birthdate_year"],
        birthdate_month: session[:userparams]["birthdate_month"],
        birthdate_day: session[:userparams]["birthdate_day"],
        phone_number: session[:userparams]["phone_number"]
      )

      @user.save!

      @address=Address.new(
        prefecture_id: session[:address_params]["prefecture_id"],
        address_last_name: session[:address_params]["address_last_name"],
        address_first_name: session[:address_params]["address_first_name"],
        address_last_name_kana:session[:address_params]["address_last_name_kana"],
        address_first_name_kana: session[:address_params]["address_first_name_kana"],
        address_number: session[:address_params]["address_number"],
        address_city: session[:address_params]["address_city"],
        address_block: session[:address_params]["address_block"],
        address_building: session[:address_params]["address_building"],
        address_phone_number:session[:address_params]["address_phone_number"],
        user_id:  @user.id
      )
      
      @address.save!

      customer = Payjp::Customer.create(email: session[:email], card: params['payjp-token'])
      @card = Card.new(customer_id: customer.id, card_id: customer.default_card, user_id: @user.id)
      @card.save!
    end

    sign_in User.find(@user.id) unless user_signed_in?
    redirect_to step5_signup_index_path
  end

  def step5
  end

  private
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email,
      :image,
      :profile, 
      :password, 
      :password_confirmation, 
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana, 
      :birthdate_year,
      :birthdate_month,
      :birthdate_day,
      :phone_number,
    )
  end
  def address_params
    params.require(:address).permit(
      :prefecture_id, 
      :address_last_name, 
      :address_first_name, 
      :address_last_name_kana, 
      :address_first_name_kana, 
      :address_number,
      :address_city,
      :address_block,
      :address_building,
      :address_phone_number,
      :user_id
    )
  end
end