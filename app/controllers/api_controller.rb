class ApiController < ApplicationController
  before_action :set_locale
  def set_locale
    I18n.locale = current_user ? current_user.locale : 'en'
  end

  before_action :authenticate_user!
end
