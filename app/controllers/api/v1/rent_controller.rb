module Api
  module V1
    class RentController < ApiController
      layout 'mailer'
      def index
        Rent.where(user_id: current_user.id).each do |rent|
          authorize rent
        end
        render_paginated Rent.where(user_id: current_user.id)
      end

      def create
        rent = Rent.new(create_params)
        authorize rent
        return render json: 'Rent creation failed', status: :bad_request unless rent.save

        UserMailer.rent_created(rent.id).deliver_later
        render json: 'Rent created and saved!'
      end

      private

      def create_params
        params.permit(:user_id, :book_id, :initial_date, :final_date)
      end
    end
  end
end
