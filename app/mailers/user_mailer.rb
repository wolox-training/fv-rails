class UserMailer < ApplicationMailer
  require 'date'

  def rent_created(rent_id)
    @rent = Rent.find(rent_id)
    @book = @rent.book
    @user = @rent.user
    @url  = :host
    @date = Time.zone.now
    mail(to: @user.email,
         subject: 'Rent created succesfully',
         date: Time.zone.now)
  end
end
