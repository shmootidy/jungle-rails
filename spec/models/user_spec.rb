require 'rails_helper'

RSpec.describe User, type: :model do

  subject { described_class.create(
    first_name: 'Bat',
    last_name: 'Man',
    email: 'bat@man.com',
    password: 'password123',
    password_confirmation: 'password123'
    )
  }

  # before :each do
  #   @subject = User.create({

  #   })
  # end

  describe 'Validations' do

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without matching passwords' do
      subject.password = 'admin123'
      expect(subject).to_not be_valid
    end

    it 'is not valid without a unique email address' do
      second_user = described_class.new(
        first_name: 'Cat',
        last_name: 'Woman',
        email: subject.email, # must be passed this way, not as string, for test to pass; otherwise, test seems to not know about the instance of Batman
        password: 'password123',
        password_confirmation: 'password123'
        )
      expect(second_user).to_not be_valid
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


  describe '.authenticate_with_credentials' do
    it 'should return an instance of the user if successfully authenticated' do
      expect(User.authenticate_with_credentials(subject.email, subject.password)).to be_instance_of(User)
      subject.email = ' bat@man.com' # cannot pass email directly or test will not recognize subject instance
      expect(User.authenticate_with_credentials(subject.email, subject.password)).to be_instance_of(User)
    end

    it 'should return nil if not successfully authenticated' do
      expect(User.authenticate_with_credentials(subject.email, 'wrongpassword')).to be nil
      expect(User.authenticate_with_credentials('test@test.com', subject.password)).to be nil
    end

  end

end
