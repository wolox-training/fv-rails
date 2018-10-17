module Api
  module V1
    class BookSuggestionController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        new_book_sugg = BookSuggestion.new(create_params)
        new_book_sugg.user = current_user || nil
        if new_book_sugg.save
          render json: 'Book suggestion created and saved!',
                 status: :created
        else
          render json: 'The book suggestion could not be created',
                 status: :bad_request
        end
      end

      private

      def create_params
        params.permit(:user_id, :title, :author, :publisher, :link, :year,
                      :synopsis, :price)
      end
    end
  end
end
