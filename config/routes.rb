Rails.application.routes.draw do

  post 'rents/create', to:'rent#create'
  get 'rents', to: 'rent#index'
  get 'books', to: 'book#index'
  get 'books/show', to: 'book#show'
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
