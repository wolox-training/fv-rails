module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate
      include DeviseTokenAuth::Concerns::SetUserByToken
      protect_from_forgery with: :null_session
      before_action :authenticate_user!
      before_action :set_locale
      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

      def user_not_authorized
        flash[:warning] = "You have met a terrible fate, haven't you?"
        redirect_to '/api/v1/book'
      end

      def set_locale
        I18n.locale = current_user ? current_user.locale : 'en'
      end
    end
  end
end
