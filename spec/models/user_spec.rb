require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    subject { described_class.new(
      first_name: 'Bat',
      last_name: 'Man',
      email: 'bat@man.com',
      password: 'password123',
      password_confirmation: 'password123'
      )
    }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without matching passwords'
    it 'is not valid without a unique email address'
    it 'is not valid without an email present'
    it 'is not valid without a first name present'
    it 'is not valid without a last name present'
  end

end
