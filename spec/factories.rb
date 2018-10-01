FactoryBot.define do

  factory :book do
    title Faker::Book.title
    author Faker::Book.author
    publisher Faker::Book.publisher
    year '2018'
    genre Faker::Book.genre
    image ':O'

    trait :nilAuthor do
      author nil
    end

    trait :nilTitle do
      title nil
    end

  end

end
