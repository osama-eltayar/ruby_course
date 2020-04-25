Rails.application.routes.draw do
  get 'users/new'
  post 'users/create'
  resources :articles do
    resources :comments
  end
  # match ':controller(/:action(/:id))(.:format)'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
