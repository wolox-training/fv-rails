module Api
  module V1
    class BookController < ApiController
      
      def index
        render_paginated Book.all
      end

      def show
        render json: Book.find(params[:id])
      end
    end
  end
end
