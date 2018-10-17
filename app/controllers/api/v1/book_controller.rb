module Api
  module V1
    class BookController < ApiController
      def index
        render_paginated Book.all
      end

      def isbn
        response = OpenLibraryService.new(params[:isbn]).book_info
        if response.nil?
          render json: 'Error: bad ISBN code', status: :bad_request
        else
          render json: response
        end
      end

      def show
        render json: Book.find(params[:id])
      end
    end
  end
end
