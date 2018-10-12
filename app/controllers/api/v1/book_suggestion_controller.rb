module Api
  module V1
    class BookSuggestionController < ApplicationController
      skip_before_action :verify_authenticity_token

      def create
        bs = BookSuggestion.new(create_params)
        bs.user_id = current_user ? current_user.id : nil
        if bs.save
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
