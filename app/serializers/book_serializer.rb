class BookSerializer < ActiveModel::Serializer
  attributes :title, :author, :genre, :publisher, :year, :image,
             :created_at, :updated_at
end
