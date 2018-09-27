require 'rails_helper'

describe Book, type: :model do
  it do
    should validate_presence_of(:title)
  end
  it do
    should validate_presence_of(:author)
  end

  subject(:book) do
    Book.new(
      title: title, author: author, genre: genre, year: year,
      publisher: publisher, image: image
    )
  end

  let(:title)                { Faker::Book.title }
  let(:author)               { Faker::Book.author }
  let(:publisher)            { Faker::Book.publisher }
  let(:genre)                { Faker::Book.genre }
  let(:image)                { ':O' }
  let(:year)                 { '2018' }

  it do
    is_expected.to be_valid
  end

  #  describe '#generate_verification_code' do
  #    context 'When the user is created' do
  #      it 'generates a random verification code' do
  #        user.save!
  #        expect(user.verification_code).to be_present
  #      end
  #    end
  #  end

  describe '#create' do
    context 'When the author is nil' do
      let(:author) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the title is nil' do
      let(:title) { nil }

      it do
        is_expected.to be_invalid
      end
    end
  end
end
