Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  root 'items#index'
  get '/mypage' => 'users#mypage'
=======
  root 'items#index'
>>>>>>> dac12bb4a97271d15f4df9780c97fdc3d266b49a
end
