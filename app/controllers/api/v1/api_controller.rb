module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate
      include DeviseTokenAuth::Concerns::SetUserByToken
      protect_from_forgery with: :exception
      before_action :authenticate_user!
    end
  end
end
