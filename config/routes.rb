Rails.application.routes.draw do
    devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'

  resources :posts
end
