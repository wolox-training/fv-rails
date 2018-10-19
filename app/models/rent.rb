class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user, :book, :initial_date, :final_date, presence: true
  validate :dates

  protected

  def dates
    return if valid_dates?

    errors.add(:base, 'The dates entered are invalid')
    false
  end

  def valid_dates?
    book.rents.where(initial_date: initial_date..final_date,
                     final_date: initial_date..final_date).empty?
  end
end
