Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'items#index'
  resources :items do
    collection do
      get 'purchase/:id', to: 'items#purchase', as: 'purchase'
      post 'pay/:id', to: 'items#pay', as: 'pay'
      get '/search', to: 'items#search', as: 'search'
    end
  end

  get '/mypage/:id', to: 'users#mypage', as: "mypage"
  get '/sign_up' => 'users#resistration'
  get '/sign_up/2' => 'users#tell'
  get '/sign_up/3' => 'users#address'
  get '/sign_up/4' => 'users#credit'
  get '/sign_up/5' => 'users#finish'
  get '/mypage/2' => 'users#edit'
  get '/signup' => 'users#signup'
  get '/identification' => 'users#identification'
  get '/cardselect' => 'users#cardselect'
  get '/logout', to: 'users#logout', as: "logout"
  get '/login', to: 'users#login', as: "login"
  get 'sell/get_category_children' => 'items#get_category_children', defaults: { format: 'json' }
  get 'sell/get_category_grandchildren' => 'items#get_category_grandchildren', defaults: { format: 'json' }
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
