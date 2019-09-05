  Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show]
  # 以下はダミーです
  get '/mypage/:id', to: 'users#mypage', as: "mypage"
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
  get '/logout', to: 'users#logout', as: "logout"
  get '/login', to: 'users#login', as: "login"
  resources :signup do
    collection do
      get 'step1'
      post 'step1_create'
      get 'step2'
      post 'step2_create'
      get 'step3'
      post 'step3_create'
      get 'step4'
      post 'step4_create'
      get 'step5'
    end
  end
  get '/sell' => 'items#sell'
end
