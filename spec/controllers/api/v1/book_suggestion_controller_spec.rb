require 'rails_helper'
require 'support/shared_context'

describe Api::V1::BookSuggestionController, type: :controller do
  include_context 'Authenticated User'
  include Devise::Test::ControllerHelpers
  describe 'POST #create' do
    subject(:post_create) { post :create, params: book_sugg }

    context 'When creating a BookSuggestion with a valid user' do
      let(:book_sugg) { attributes_for(:book_suggestion, user: user) }
      it 'creates a new book_suggestion' do
        expect { subject }.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        subject
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating a BookSuggestion with no user' do
      let(:book_sugg) { attributes_for(:book_suggestion, user: nil) }
      it 'creates a new book_suggestion' do
        expect { subject }.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        subject
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating a BookSuggestion with no author' do
      let(:book_sugg) { attributes_for(:book_suggestion, author: nil) }
      it 'does not create a new BookSuggestion' do
        expect { subject }.to change { BookSuggestion.count }.by(0)
      end

      it 'responds with 422 status' do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
