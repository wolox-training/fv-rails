class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  ## TODO: When we start configuring controllers we will transfer this to the ApiController
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
end
