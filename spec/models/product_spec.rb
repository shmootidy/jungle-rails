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
      expect(subject.errors).to be_empty
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
      expect(subject.errors[:name].first).to eq 'can\'t be blank'
    end

    it 'is not valid without a price' do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a quantity' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a category' do
      subject.category_id = nil
      expect(subject).to_not be_valid
    end

  end
end
