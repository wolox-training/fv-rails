module Api
  module V1
    class BookController < ApiController
      def index
        if params[:isbn].nil?
          render_paginated Book.all
        else
          show_isbn
        end
      end

      def show_isbn
        response = OpenLibraryService.book_info(params[:isbn])
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
