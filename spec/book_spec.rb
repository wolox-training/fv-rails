require 'rails_helper'

describe Book, type: :model do
  it do
    should validate_presence_of(:titulo)
  end
  it do
    should validate_presence_of(:autor)
  end

  subject(:book) do
    Book.new(
      titulo: titulo, autor: autor, genero: genero, año: año,
      editor: editor, image: image
    )
  end

  let(:titulo)                { Faker::Book.title }
  let(:autor)                 { Faker::Book.author }
  let(:editor)                { Faker::Book.publisher }
  let(:genero)                { Faker::Book.genre }
  let(:image)                 { ':O' }
  let(:año)                   { '2018' }

  it do
    is_expected.to be_valid
  end

#  describe '#generate_verification_code' do
#    context 'When the user is created' do
#      it 'generates a random verification code' do
#        user.save!
#        expect(user.verification_code).to be_present
#      end
#    end
#  end

  describe '#create' do
    context 'When the author is nil' do
      let(:autor) { nil }

      it do
        is_expected.to be_invalid
      end
    end

    context 'When the last_name is nil' do
      let(:titulo) { nil }

      it do
        is_expected.to be_invalid
      end
    end
  end
end
