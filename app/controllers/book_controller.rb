class BookController < ApplicationController
  include Wor::Paginate

  def index
    render_paginated Book.all, limit: 2
  end

  def show
    render json: Book.find(params[:id])
  end
end
