class UserMailer < ApplicationMailer
  require 'date'

  def rent_created(rent)
    @rent = rent
    @book = Book.find(rent.book_id)
    @user = User.find(rent.user_id)
    @url  = 'localhost:3000'
    mail(to: @user.email,
         subject: 'Rent created succesfully',
         date: DateTime.now) do |format|
           format.html
         end
  end

  def mail_test(user_id)
    @user = User.find(user_id)
    mail( to: @user.email,
          subject: 'test') do |format|
            format.html
        end
  end
end
