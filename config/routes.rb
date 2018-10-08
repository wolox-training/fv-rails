Rails.application.routes.draw do
  api_version(:module => "Api/V1", :path => {:value => "api/v1"}) do
    resources :book, only: [:index, :show]
    resources :rent, only: [:index, :create]
  end
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
