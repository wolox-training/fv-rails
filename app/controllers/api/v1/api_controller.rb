module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate
      include DeviseTokenAuth::Concerns::SetUserByToken
      protect_from_forgery with: :null_session
      before_action :authenticate_user!
      before_action :set_locale

      def set_locale
        I18n.locale = current_user ? current_user.locale : 'en'
      end
    end
  end
end
