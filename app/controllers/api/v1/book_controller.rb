module Api
  module V1
    class BookController < ApiController
      def index
        render_paginated Book.all
      end

      def isbn
        begin
          isbn = params.require(:isbn)
        rescue ActionController::ParameterMissing
          return render json: 'Error: no ISBN code was entered',
                        status: :bad_request
        end
        response = OpenLibraryService.fetch(isbn)
        return render json: 'Error: bad ISBN code', status: :bad_request if response.nil?

        render json: response
      end

      def show
        render json: Book.find(params[:id])
      end
    end
  end
end
