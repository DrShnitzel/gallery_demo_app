require 'rails_helper'

RSpec.describe User, type: :model do
  let(:existed_user) { FactoryGirl.create :user }

  describe 'odject' do
    it 'is valid with correct data' do
      user = User.new(email: 'cor.rect@email.com',)
      expect(user).to be_valid
    end
     it 'is invalid with incorrect email' do
      user = User.new(email: 'incorrectemail.com@',)
      expect{user.valid?}.to raise_error(ActiveModel::StrictValidationFailed)
    end
    it 'is invalid without email' do
      user = User.new()
      expect{user.valid?}.to raise_error(ActiveModel::StrictValidationFailed)
    end
    it 'is invalid if email is already taken' do
      user = User.new(email: existed_user.email)
      expect{user.valid?}.to raise_error(ActiveModel::StrictValidationFailed)
    end
  end

  describe '.registration' do
    it 'creates new user with correct data' do
      condition = -> {User.registration('newuser@example.com', '12345678')}
      expect{condition.call}.to change{User.count}.from(0).to(1)
    end
  end

  describe '#update_password' do
    it 'changes passwd_hash' do
      old_passwd_hash = existed_user.passwd_hash
      existed_user.update_password('new_password')
      expect(old_passwd_hash).not_to eq(existed_user.passwd_hash)
    end
    it 'validates password' do
      condition = -> {existed_user.update_password('')}
      expect{condition.call}.to raise_error(ActiveModel::StrictValidationFailed)
    end
  end

  describe '#check_auth' do
    it 'returns true for correct password' do
      expect(existed_user.check_auth('password')).to eq(true)
    end
    it 'returns false for incorrect password' do
      expect(existed_user.check_auth('wrong_password')).to eq(false)
    end
  end

  describe '#change_token' do
    it 'changes token' do
      old_token = existed_user.token
      existed_user.change_token
      expect(existed_user.token).not_to eq(old_token)
    end
  end

end
