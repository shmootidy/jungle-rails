require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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

  scenario 'A user can navigate from the home page to the product detail page by clicking on a product' do
    #ACT
    visit '/'
    first('article.product header a').click
    #DEBUG
    # sleep 2
    # save_screenshot('product-details.png')
    #VERIFY
    expect(page).to have_css 'article.product-detail'
  end

end
