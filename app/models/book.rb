class Book < ApplicationRecord
  validates :title, :author, :genre, :publisher, :year,
            :image, presence: true
end
