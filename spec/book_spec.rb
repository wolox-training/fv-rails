require 'rails_helper'

describe Book, type: :model do

  let(:book) { create(:book) }
  subject { book }

  describe '#create' do
    context 'When the book is properly set' do
      it do
        is_expected.to be_valid
      end
    end

    context 'When the author is nil' do
      it do
        book.author = nil
        expect(book).to be_invalid
      end
    end

    context 'When the title is nil' do
      it do
        book.title = nil
        expect(book).to be_invalid
      end
    end

    context 'When the genre is nil' do
      it do
        book.genre = nil
        expect(book).to be_invalid
      end
    end

    context 'When the image is nil' do
      it do
        book.image = nil
        expect(book).to be_invalid
      end
    end

    context 'When the publisher is nil' do
      it do
        book.publisher = nil
        expect(book).to be_invalid
      end
    end

    context 'When the year is nil' do
      it do
        book.year = nil
        expect(book).to be_invalid
      end
    end
  end
end
