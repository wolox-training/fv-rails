FactoryBot.define do
  factory :book_suggestion do
    synopsis { Faker::HowIMetYourMother.quote }
    price { Faker::Number.number(3) }
    author { Faker::Book.author  }
    title { Faker::Book.title }
    link { Faker::Internet.url }
    publisher { Faker::Book.publisher }
    year { Faker::Time.backward(14, :evening).year }
    user { nil }
  end
end
