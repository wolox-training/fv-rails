module V1
  class BookController < V1::BaseController
    include Wor::Paginate
    include DeviseTokenAuth::Concerns::SetUserByToken
    def index
      render_paginated Book.all
    end

    def show
      render json: Book.find(params[:id])
    end
  end
end
