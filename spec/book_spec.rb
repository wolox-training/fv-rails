require 'rails_helper'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

describe Book, type: :model do
  subject(:book) { create(:book) }

  after(:all) do
    DatabaseCleaner.clean
    puts 'The database should be clean nao'
  end

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
