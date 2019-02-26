require 'rails_helper'

RSpec.feature "Visitor navigates to the home page", type: :feature, js: true do

  scenario 'They see all products' do
  # ACT
  visit root_path

  # DEBUG / VERIFY
  save_screenshot('screenshot.png')

  expect(page).to have_css 'article.product'
  end

end
