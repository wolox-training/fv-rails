module Api
  module V1
    class ApiController < ApplicationController
      include Wor::Paginate
      include DeviseTokenAuth::Concerns::SetUserByToken
      protect_from_forgery with: :null_session
    end
  end
end
