class RentController < ApplicationController
  include Wor::Paginate
  include DeviseTokenAuth::Concerns::SetUserByToken

  def create
    rent = Rent.create(user_id: params[:user], book_id: params[:book],
                       initial_date: params[:idate], final_date: params[:fdate])
    ummm = UserMailer.rent_created(rent)
    ummm.deliver_now
  end

  def index
    render_paginated Rent.all, limit: 2
  end

  before_action :authenticate_user!
end
