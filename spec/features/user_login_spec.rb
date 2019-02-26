require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  #SETUP
  before :each do
    @user = User.create!(
      first_name: 'Wonder',
      last_name: 'Woman',
      email: 'wonder@woman.com',
      password: 'password123',
      password_confirmation: 'password123'
      )
  end
  scenario 'A registered user can log in using the log in form' do
    #ACT
    #DEBUG
    save_screenshot 'user-login.jpg'
    #VERIFY
  end
end
