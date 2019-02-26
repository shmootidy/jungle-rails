require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(1),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'A user can add an item to cart by clicking the Add to Cart button on a product on the home page' do
    #ACT
    visit '/'
      # click on add to cart
    #DEBUG
    save_screenshot 'add-to-cart.jpg'
    #VERIFY
    expect(page).to have_text 'My Cart (1)'
  end

end
