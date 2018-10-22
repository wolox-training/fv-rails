module Api
  module V1
    class BookController < ApiController
      def index
        render_paginated Book.all
      end

      def isbn
        isbn = params.require(:isbn)
        response = OpenLibraryService.new(isbn).book_info
        return render json: 'Error: bad ISBN code', status: :bad_request if response == {}

        render json: response
      end

      def show
        render json: Book.find(params[:id])
      end
    end
  end
end
