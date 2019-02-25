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

    it 'is not valid without matching passwords' do
      subject.password = 'admin123'
      expect(subject).to_not be_valid
    end

    it 'is not valid without a unique email address' do
      @second_user = described_class.create(
        first_name: 'Cat',
        last_name: 'Woman',
        email: 'catwo@man.com',
        password: 'password123',
        password_confirmation: 'password123'
        )
      subject.email = 'catwo@man.com'
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email address present' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a first name present' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a last name present' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a password of at least 6 characters' do
      subject.password = 'admin'
      subject.password_confirmation = 'admin'
      expect(subject).to_not be_valid
    end
  end

end
