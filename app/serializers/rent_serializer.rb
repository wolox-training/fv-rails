class RentSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :returned_at, :book, :user

  def returned_at
    nil
  end

  def from
    object.initial_date
  end

  def to
    object.final_date
  end
end
