require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    let(:category) { Category.create }

    subject { described_class.new(
      name: 'a name',
      price: 123,
      quantity: 123,
      category_id: category.id
      )
    }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid without a quantity'
    it 'is not valid without a category'
  end
end
