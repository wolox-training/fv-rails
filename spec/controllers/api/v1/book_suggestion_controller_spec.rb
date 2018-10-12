describe Api::V1::BookSuggestionController, type: :controller do
  include_context 'Authenticated User'
  include Devise::Test::ControllerHelpers

  describe 'POST #create' do
    context 'When creating a BookSuggestion with a valid user' do
      let!(:book_sugg) { create(:book_suggestion, user: user) }
      let(:post_create) do
        post :create,
             params: { user_id: book_sugg.user_id, title: book_sugg.title,
                       link: book_sugg.link, year: book_sugg.year,
                       publisher: book_sugg.publisher, author: book_sugg.author }
      end
      it 'creates a new book_suggestion' do
        expect do
          post_create
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post_create
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating a BookSuggestion with no user' do
      let!(:book_sugg) { create(:book_suggestion) }
      let(:post_create) do
        post :create,
             params: { user_id: book_sugg.user_id, title: book_sugg.title,
                       link: book_sugg.link, year: book_sugg.year,
                       publisher: book_sugg.publisher, author: book_sugg.author }
      end
      it 'creates a new book_suggestion' do
        expect do
          post_create
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post_create
        expect(response).to have_http_status(:created)
      end
    end
  end
end
