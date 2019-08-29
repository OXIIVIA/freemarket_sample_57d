Rails.application.routes.draw do
  root 'items#index'
  get '/mypage' => 'users#mypage'
end
