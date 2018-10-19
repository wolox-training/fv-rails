require 'rails_helper'

describe Book, type: :model do
  include Devise::Test::IntegrationHelpers
  subject(:book) { create(:book) }

  describe '#create' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:genre) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:year) }
    it { is_expected.to validate_presence_of(:publisher) }
    it { is_expected.to validate_presence_of(:image) }
  end
end
