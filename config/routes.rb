Rails.application.routes.draw do
  root 'items#index'
  resources :items, only: [:index, :show]
  # 以下はダミーです
  get '/mypage' => 'users#mypage'
  get '/sign_up' => 'users#resistration'
  get '/sign_up/2' => 'users#tell'
  get '/sign_up/3' => 'users#address'
  get '/sign_up/4' => 'users#credit'
  get '/sign_up/5' => 'users#finish'
  get '/mypage/2' => 'users#edit'
  get '/purchase/' => 'users#purchase'
  get '/signup' => 'users#signup'
  get '/identification' => 'users#identification'
  get '/cardselect' => 'users#cardselect'
  get '/logout' => 'users#logout'
  get '/login' => 'users#login'
  resources :signup do
    collection do
      get 'step1'
      post 'step1_create'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5' 
      get 'step6' 
    end
  end
  get '/sell' => 'items#sell'
end
