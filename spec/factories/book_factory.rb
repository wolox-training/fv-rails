FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    publisher { Faker::Book.publisher }
    year { Faker::Time.backward(14, :evening).year }
    genre { Faker::Book.genre }
    image { Faker::Internet.url }
  end
end
