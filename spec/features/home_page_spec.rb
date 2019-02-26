require 'rails_helper'

RSpec.feature "Visitor navigates to the home page", type: :feature, js: true do

  before :each do
    @category = Category.create! near: 'Apparel'

    10.time do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(1),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'They see all products' do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot('screenshot.png')

    #VERIFY
    expect(page).to have_css 'article.product'
  end

end
