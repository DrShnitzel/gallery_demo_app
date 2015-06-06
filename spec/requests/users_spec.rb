require 'rails_helper'

describe 'Users API' do
  let(:user) { FactoryGirl.create :user }

  describe 'POST /api/users' do
    context 'when user doesn\'t exist' do
      it 'creates a new user and returns token' do
        params = { email: 'newuser@example.com', passwd: '12345678' }
        post '/api/users',  params
        expect(User.count).to eq(1)
        expect(json['token']).not_to be_empty
      end
    end

    context 'when user exists' do
      it 'doesn\'t create a new user and returns bad_request' do
        params = { email: user.email, passwd: '12345678' }
        post '/api/users',  params
        expect(User.count).to eq(1)
        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'POST /api/users/login' do
    context 'when passwd is correct' do
      it 'returns token' do
        params = { email: user.email, passwd: 'password' }
        post '/api/users/login',  params
        expect(json['token']).not_to be_empty
      end
    end
    context 'when passwd is incorrect' do
      it 'returns bad_request' do
        params = { email: user.email, passwd: 'wrong_password' }
        post '/api/users/login',  params
        expect(response).to have_http_status(400)
      end
    end
  end

  describe 'POST /api/users/logout' do
    it 'changes token' do
      old_token = user.token
      params = { token: old_token }
      post '/api/users/logout',  params
      expect(response).to be_success
      expect(user.reload.token).not_to eq(old_token)
    end
  end

  describe 'PUT /api/users/password' do
    it 'changes password' do
      params = {
        token: user.token,
        passwd: 'new_password',
        old_passwd: 'password'
      }
      put '/api/users/password',  params
      expect(response).to be_success
      params = { email: user.email, passwd: 'new_password' }
      post '/api/users/login',  params
      expect(json['token']).not_to be_empty
    end
  end

  describe 'DELETE /api/users' do
    it 'deletes user' do
      params = { token: user.token }
      delete '/api/users',  params
      expect(response).to be_success
      expect(User.count).to eq(0)
    end
  end
end
