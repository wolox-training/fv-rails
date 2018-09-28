class BookController < ApplicationController
  def index
    render json: Book.all
  end

  def show
    
  end
end
