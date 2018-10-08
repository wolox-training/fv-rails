Rails.application.routes.draw do
  get 'book/index', to: 'book#index'
  get 'book/show', to: 'book#show'
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
