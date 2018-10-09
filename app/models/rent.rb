class Rent < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :book, optional: true
  validates :user, :book, :initial_date, :final_date, presence: true
end
