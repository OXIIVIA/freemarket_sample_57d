Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get '/mypage' => 'users#mypage'
  get '/signup' => 'users#signup'
  get '/identification' => 'users#identification'
  get '/cardselect' => 'users#cardselect'
  get '/logout' => 'users#logout'
  get '/login' => 'users#login'
end
