require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'is valid with valid attributes' do
      @category = Category.create
      @product = Product.new(
        name: 'a name',
        price: 123,
        quantity: 123,
        category_id: @category.id
        )
      expect(@product).to be_valid
    end

    it 'is not valid without a name'
    it 'is not valid without a price'
    it 'is not valid without a quantity'
    it 'is not valid without a category'
  end
end
