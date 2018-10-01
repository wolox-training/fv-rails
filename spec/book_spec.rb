require 'rails_helper'

describe Book, type: :model do
  #  before(:all) do
  #    @book = create(:book)
  #  end

  it do
    should validate_presence_of(:title)
  end
  it do
    should validate_presence_of(:author)
  end

  #  subject(:book) do
  #    create(:book)
  #  end

  #  let(:title)                { Faker::Book.title }
  #  let(:author)               { Faker::Book.author }
  #  let(:publisher)            { Faker::Book.publisher }
  #  let(:genre)                { Faker::Book.genre }
  #  let(:image)                { ':O' }
  #  let(:year)                 { '2018' }

  describe '#create' do
    context 'When the book is properly set' do
      let(:book) { create(:book) }
      it do
        expect(book).to be_valid
      end
    end

    context 'When the author is nil' do
      let(:nilAuthor) { create(:book, author: '') }
      it do
        is_expected.to be_invalid
      end
    end

    context 'When the title is nil' do
      let(:nilTitle) { create(:book, title: '') }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the genre is nil' do
      let(:nilGenre) { create(:book, genre: '') }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the image is nil' do
      let(:nilImage) { create(:book, image: '') }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the publisher is nil' do
      let(:nilPublisher) { create(:book, publisher: '') }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the year is nil' do
      let(:nilYear) { create(:book, year: '') }

      it do
        is_expected.to be_invalid
      end
    end
  end
end
