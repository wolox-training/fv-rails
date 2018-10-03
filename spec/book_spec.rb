require 'rails_helper'

describe Book, type: :model do
  subject(:book) { create(:book) }

  describe '#create' do
    context 'When the book is properly set' do
      it do
        is_expected.to be_valid
      end
    end

    context 'When the book is created' do
      it do
        %i[author title genre image publisher year].each do |attr|
          is_expected.to validate_presence_of(attr)
        end
      end
    end
  end
end
