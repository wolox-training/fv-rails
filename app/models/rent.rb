class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user, :book, :initial_date, :final_date, presence: true

  def valid_dates?
    book_rents = Rent.where('book_id = ?', book_id)
    book_rents.all? do |previous_rent|
      previous_rent.initial_date > final_date || previous_rent.final_date < initial_date
    end
  end
end
