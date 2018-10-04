class RentController < ApplicationController
  include Wor::Paginate
  include DeviseTokenAuth::Concerns::SetUserByToken

  def create
    Rent.create(user_id: params[:user], book_id: params[:book],
                initial_date: params[:idate], final_date: params[:fdate])
  end

  def index
    render_paginated Rent.where(user_id: params[:user_id]), limit: 2
  end

  before_action :authenticate_user!
end
