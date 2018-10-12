describe Api::V1::BookSuggestionController, type: :controller do
  include_context 'Authenticated User'
  include Devise::Test::ControllerHelpers

  describe 'POST #create' do

    context 'When creating a valid user BookSuggestion' do
      let!(:book_sugg) { create(:book_suggestion, user: user) }
      it 'creates a new book_suggestion' do
        expect do
          post :create,
            params: { user_id: user.id, title: book_sugg.title,
                      link: book_sugg.link, year: book_sugg.year,
                      publisher: book_sugg.publisher, author: book_sugg.author }
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create,
          params: { user_id: user.id, title: book_sugg.title,
                    link: book_sugg.link, year: book_sugg.year,
                    publisher: book_sugg.publisher, author: book_sugg.author }
        expect(response).to have_http_status(:created)
      end
    end

    context 'When creating a book suggestion with no user' do
      let!(:book_sugg) { create(:book_suggestion) }

      it 'creates a new book_suggestion' do
        expect do
          post :create,
            params: { user_id: nil, title: book_sugg.title,
                      link: book_sugg.link, year: book_sugg.year,
                      publisher: book_sugg.publisher, author: book_sugg.author }
        end.to change { BookSuggestion.count }.by(1)
      end

      it 'responds with 201 status' do
        post :create,
          params: { user_id: nil, title: book_sugg.title,
                    link: book_sugg.link, year: book_sugg.year,
                    publisher: book_sugg.publisher, author: book_sugg.author }
        expect(response).to have_http_status(:created)
      end
    end
  end
end
