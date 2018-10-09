class ApiController < ActionController::Base
  include Wor::Paginate
  include DeviseTokenAuth::Concerns::SetUserByToken
  ## TODO: When we start configuring controllers we will transfer this to the ApiController
  protect_from_forgery with: :null_session
end
