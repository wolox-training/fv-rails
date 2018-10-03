class Book < ApplicationRecord
  validates :title, :author, :genre, :publisher, :year,
            :image, presence: true

  has_many :rents, dependent: :destroy
end
