module Api
  module V1
    class BookSuggestionController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        new_book_sugg = BookSuggestion.new(create_params)
        new_book_sugg.user_id = current_user || nil
        if new_book_sugg.save
          render json: 'Book suggestion created and saved!'
        else
          render json: 'The book suggestion could not be created'
        end
      end

      private

      def create_params
        params.permit(:title, :author, :publisher, :link, :year,
                      :synopsis, :price)
      end
    end
  end
end
