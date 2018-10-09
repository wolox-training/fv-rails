Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  api_version(:module => "Api/V1", :path => {:value => "api/v1"}) do
    resources :book, only: [:index, :show]
    resources :rent, only: [:index, :create]
  end
  mount_devise_token_auth_for 'User', at: 'auth'
end
