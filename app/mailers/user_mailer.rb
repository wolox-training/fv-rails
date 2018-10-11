class UserMailer < ApplicationMailer
  require 'date'

  def rent_created(rent_id)
    @rent = Rent.find(rent_id)
    @book = @rent.book
    @date = Time.zone.now
    mail(to: @user.email,
         subject: default_i18n_subject,
         date: Time.zone.now)
  end
end
