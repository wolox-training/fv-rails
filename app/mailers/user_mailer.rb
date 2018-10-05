class UserMailer < ApplicationMailer
  require 'date'

  def rent_created(rent)
    @rent = rent
    @book = Book.find(rent.book_id)
    @user = User.find(rent.user_id)
    @url  = 'localhost:3000'
    @date = Time.zone.now
    mail(to: @user.email,
         subject: default_i18n_subject,
         date: Time.zone.now)
  end

  def mail_test(user_id)
    @user = User.find(user_id)
    mail(to: @user.email,
         subject: 'test')
  end
end
