class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      # username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
      username == "admin" && password == "2222"
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:signup, keys: [:name,:nickname,:image,:last_name,:first_name,:last_name_kana,:first_name_kana,:birthdate_year,:birthdate_month,:birthdate_day,:phone_number])
  end
end
