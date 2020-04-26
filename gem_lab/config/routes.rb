Rails.application.routes.draw do
 

  devise_for :models
  resources :articles do
    resources :comments
  end
  # match ':controller(/:action(/:id))(.:format)'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
