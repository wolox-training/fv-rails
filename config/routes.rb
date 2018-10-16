Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  api_version(:module => "Api/V1", :path => {:value => "api/v1"}) do
    resources :book, only: [:index, :show]
    resources :rent, only: [:index, :create]
    resources :book_suggestion, only: [:create]
    resources :open_library, only: [:show]
  end
  mount_devise_token_auth_for 'User', at: 'auth'
end
