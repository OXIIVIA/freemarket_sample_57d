# class CardsController < ApplicationController
#   require "payjp"


#   def new
#     card = Card.where(session[:email])
#     redirect_to action: "show" if card.exists?
#   end


#   def pay # payjpとCreditのdb作成
#     Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
#     if params['payjp-token'].blank?
#        redirect_to action:"new"
#     else
#       customer = Payjp::Customer.create(
#       email: session[:email], 
#       card: params['payjp-token']
#       )
#       # ここでdbに保存する。signupの方でcreateしないのはredirect_toでPOSTに飛ばせないから。
#       @user = User.new(session[:user_params])
#       @user.build_profile(session[:profile_attributes_after_delivery])
#       if @user.save
#         @card = Credit.create(user_id: @user.id, customer_id: customer.id, card_id: customer.default_card)
#         session[:id] = @user.id
#         redirect_to complete_signup_signup_index_path
#       else
#         render '/signup/step5'
#       end
#     end
#   end

#  # カード情報削除機能をつける時に使う。
#   def delete #PayjpとCreditデータベースを削除
#     card = Credit.where(user_id: current_user.id).first
#     if card.blank?
#     else
#       Payjp.api_key = Rails.application.credentials.payjp[:payjp_secret_key]
#       customer = Payjp::Customer.retrieve(card.customer_id)
#       customer.delete
#       card.delete
#     end
#       redirect_to action: "new"
#   end

end
