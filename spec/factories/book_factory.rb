FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    publisher { Faker::Book.publisher }
<<<<<<< HEAD
    year { Faker::Time.backward(14, :evening).year }
=======
    year { Faker::Time.backward(14, :evening) }
>>>>>>> 32fab15... Changes several syntax things Rubocop didn't like
    genre { Faker::Book.genre }
    image { Faker::Internet.url }
  end
end
