require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: 'Wonder',
      last_name: 'Woman',
      email: 'wonder@woman.com',
      password: 'password123',
      password_confirmation: 'password123'
      )
  end
end
