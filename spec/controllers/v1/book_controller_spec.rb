require 'rails_helper'
require 'support/shared_context'

describe V1::BookController, type: :controller do
  include_context 'Authenticated User'
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    context 'When fetching all the books' do
      let(:books) { create_list(:book, 3) }

      it 'responses with the books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book' do
      let(:book) { create(:book) }

      subject { get :show, params: { id: book.id } }

      it 'responses with the book json' do
        expect(response.body.to_json) =~ BookSerializer.new(book).to_json
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
