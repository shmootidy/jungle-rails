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

    it 'is not valid without a name'
    it 'is not valid without a price'
    it 'is not valid without a quantity'
    it 'is not valid without a category'
  end
end
