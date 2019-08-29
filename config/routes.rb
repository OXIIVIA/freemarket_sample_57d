Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  # 以下はダミーです
  get '/mypage' => 'users#mypage'
  get '/sign_up' => 'users#resistration'
  get '/sign_up/2' => 'users#tell'
  get '/sign_up/3' => 'users#address'
  get '/sign_up/4' => 'users#credit'
  get '/sign_up/5' => 'users#finish'
  get '/sign_up/6' => 'users#edit'

end
