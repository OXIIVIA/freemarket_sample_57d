class SignupController < ApplicationController

  def step1
    @user=User.new
    # binding.pry
  end

  def step1_create
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthdate_year] = user_params[:birthdate_year]
    session[:birthdate_month] = user_params[:birthdate_month]
    session[:birthdate_day] = user_params[:birthdate_day]
    redirect_to step2_signup_index_path
  end
  
  def step2
    @user=User.new
        # step1で入力された値をsessionに保存
        # @user = User.new # 新規インスタンス作成
  end

  def step3
    # session[:phonenumber] = user_params[:phonenumber]
    # step2で入力された値をsessionに保存
    @user = User.new # 新規インスタンス作成
  end

  def step4
    # session[:phonenumber] = user_params[:phonenumber]
    # step2で入力された値をsessionに保存
    @user = User.new # 新規インスタンス作成
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
      :phone_number
    )
  end
end
