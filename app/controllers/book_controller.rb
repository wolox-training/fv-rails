class BookController < ApplicationController
  include Wor::Paginate
  include DeviseTokenAuth::Concerns::SetUserByToken

  def index
    render_paginated Book.all
  end

  def show
    render json: Book.find(params[:id])
  end
  before_action :authenticate_user!
end
