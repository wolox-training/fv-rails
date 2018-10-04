require 'rails_helper'

RSpec.describe RentController, type: :controller do
  include_context 'Authenticated User'
  include Devise::Test::ControllerHelpers

  #  describe "GET #create" do
  #    it "returns http success" do
  #      get :create
  #      expect(response).to have_http_status(:success)
  #    end
  #  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
