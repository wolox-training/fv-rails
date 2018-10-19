Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  api_version(:module => "Api/V1", :path => {:value => "api/v1"}) do
    resources :rent, only: [:index, :create]
    resources :book_suggestion, only: [:create]
    resources :book, only: [:index, :show] do
     collection do
        get 'isbn'
      end
    end
  end
  mount_devise_token_auth_for 'User', at: 'auth'
end
