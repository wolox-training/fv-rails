class BookSerializer < ActiveModel::Serializer
  attributes :title, :author, :genre, :publisher, :year
end
