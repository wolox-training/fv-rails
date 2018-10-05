class Book < ApplicationRecord
  validates :title, :author, :genre, :publisher, :year,
            :image, :locale, presence: true
end
