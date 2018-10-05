class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  ## TODO: When we start configuring controllers we will transfer this to the ApiController
  protect_from_forgery with: :null_session

  before_action :set_locale

  def set_locale
    I18n.locale = current_user.try(:locale)
  end
end
