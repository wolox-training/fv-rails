module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate
      include DeviseTokenAuth::Concerns::SetUserByToken
      protect_from_forgery with: :null_session
      before_action :authenticate_user!
      before_action :set_locale
      rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
      rescue_from ActionController::ParameterMissing, with: :missing_parameter

      def user_not_authorized
        render json: 'Autorization failure', status: :user_not_authorized
      end

      def missing_parameter
        render json: 'Error: the required parameter was not entered',
               status: :bad_request
      end

      def set_locale
        I18n.locale = current_user ? current_user.locale : 'en'
      end
    end
  end
end
