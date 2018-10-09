class BookSerializer < ActiveModel::Serializer
  attributes :title, :author, :genre, :publisher, :year, :image,
             :created_at, :updated_at
  def image
    image = Hash.new
    image[:url] = object.image
    image
  end
end
