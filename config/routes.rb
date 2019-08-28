Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  # 以下はダミーです
  get '/mypage' => 'users#mypage'
  get '/sign_up' => 'users#resistration'
  get '/sign_up/2' => 'users#tell'
end
