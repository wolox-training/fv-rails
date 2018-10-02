RSpec.shared_context 'Authenticated User' do
  let(:user) { create(:user) }

  before do
    request.headers.merge! resource.create_new_auth_token
  end
end
