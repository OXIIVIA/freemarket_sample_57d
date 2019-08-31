Rails.application.routes.draw do
  root 'items#index'
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
      get 'sign_up'
      get 'sign_up/2'
      get 'sign_up/3'
      get 'sign_up/4'
      get 'sign_up/5' 
    end
  end
end
