class SignupController < ApplicationController
  require "payjp"

  def step1
    @user=User.new
  end

  def step1_create
    session[:profile] = user_params[:profile],
    session[:nickname] = user_params[:nickname],
    session[:email] = user_params[:email],
    session[:password] = user_params[:password],
    session[:password_confirmation] = user_params[:password_confirmation],
    session[:last_name] = user_params[:last_name],
    session[:first_name] = user_params[:first_name],
    session[:last_name_kana] = user_params[:last_name_kana],
    session[:first_name_kana] = user_params[:first_name_kana],
    session[:birthdate_year] = user_params[:birthdate_year],
    session[:birthdate_month] = user_params[:birthdate_month],
    session[:birthdate_day] = user_params[:birthdate_day]
    redirect_to step2_signup_index_path
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
    session[:prefecture_id] = address_params[:prefecture_id],
    session[:address_last_name] = address_params[:address_last_name],
    session[:address_first_name] = address_params[:address_first_name],
    session[:address_last_name_kana] = address_params[:address_last_name_kana],
    session[:address_first_name_kana] = address_params[:address_first_name_kana],
    session[:address_number] = address_params[:address_number],
    session[:address_city] = address_params[:address_city],
    session[:address_block] = address_params[:address_block],
    session[:address_building] = address_params[:address_building],
    session[:address_phone_number] = address_params[:address_phone_number]
    redirect_to step4_signup_index_path
  end

  def step4
    @card = Card.new
  end

  def step4_create
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    @user=User.new(
      profile: session[:profile],
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birthdate_year: session[:birthdate_year],
      birthdate_month: session[:birthdate_month],
      birthdate_day: session[:birthdate_day],
      phone_number: session[:phone_number]
    )
    @user.save! 
    @address=Address.new(
      prefecture_id: session[:prefecture_id],
      address_last_name: session[:address_last_name],
      address_first_name: session[:address_first_name],
      address_last_name_kana:session[:address_last_name_kana],
      address_first_name_kana: session[:address_first_name_kana],
      address_number: session[:address_number],
      address_city: session[:address_city],
      address_block: session[:address_block],
      address_building: session[:address_building],
      address_phone_number:session[:address_phone_number],
      user_id:  @user.id
    )
    @address.save!
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
      :address_phone_number
    )
  end
end