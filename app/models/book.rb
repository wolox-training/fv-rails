class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :author
end
