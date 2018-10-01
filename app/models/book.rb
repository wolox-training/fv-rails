class Book < ApplicationRecord
<<<<<<< HEAD
  validates :title, :author, :genre, :publisher, :year,
            :image, presence: true
=======
  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :publisher, presence: true
  validates :year, presence: true
  validates :image, presence: true
>>>>>>> e8ce25a... Updated specs to use Factory Bot
end
