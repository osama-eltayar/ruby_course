Rails.application.routes.draw do
  get 'sessions/login' , to: 'sessions#login', as: 'login'
  post 'sessions/login' , to: 'sessions#login_attempt'
  get 'sessions/logout' , to: 'sessions#logout', as: 'logout'
  get 'sessions/home' , to: 'sessions#home'
  get 'sessions/profile' ,to: 'sessions#profile'
  get 'sessions/setting', to: 'sessions#setting'
  # resources :sessions

  get 'users/new'
  post 'users/create'

  resources :articles do
    resources :comments
  end
  # match ':controller(/:action(/:id))(.:format)'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
