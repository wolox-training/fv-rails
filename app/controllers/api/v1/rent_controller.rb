module Api
  module V1
    class RentController < ApiController
      layout 'mailer'
      def index
        if current_user
          render_paginated Rent.where(user_id: current_user.id)
        else
          render json: 'Error: cannot find user'
        end
      end

      def create
        rent = Rent.new(create_params)
        if rent.save
          UserMailer.rent_created(rent.id).deliver_later
          render json: 'Rent created and saved!'
        else
          render json: 'Something went wrong and your rent creation failed :('
        end
      end

      def show
        @rent = Rent.find(params[:id])
        authorize @rent
        render json: @rent
      end

      private

      def create_params
        params.permit(:user_id, :book_id, :initial_date, :final_date)
      end
    end
  end
end
