class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user, :book, :initial_date, :final_date, presence: true
end
