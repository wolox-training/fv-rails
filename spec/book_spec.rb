require 'rails_helper'

describe Book, type: :model do
  it do
    should validate_presence_of(:title)
  end
  it do
    should validate_presence_of(:author)
  end

  subject(:book) do
    create(:book)
  end

  #  let(:title)                { Faker::Book.title }
  #  let(:author)               { Faker::Book.author }
  #  let(:publisher)            { Faker::Book.publisher }
  #  let(:genre)                { Faker::Book.genre }
  #  let(:image)                { ':O' }
  #  let(:year)                 { '2018' }

  it do
    is_expected.to be_valid
  end

  describe '#create' do
    context 'When the author is nil' do
      let(:book) { create(:book, author: '') }

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
  end
end
