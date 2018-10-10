module Api
  module V1
    class RentController < ApiController
      include Wor::Paginate
      include DeviseTokenAuth::Concerns::SetUserByToken

      def create
        rent = Rent.new(create_params)
        if rent.save
          render json: 'Rent created and saved!'
        else
          render json: 'Something went wrong and your rent creation failed :('
        end
      end

        def index
        render_paginated Rent.where(user_id: params[:user_id]), limit: 2
      end

      private

      def create_params
        params.permit(:user_id, :book_id, :initial_date, :final_date)
      end
    end
  end
end
