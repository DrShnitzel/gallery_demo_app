require 'rails_helper'

describe 'Media Data API' do
  let(:user) { FactoryGirl.create :user }
  let(:file) { fixture_file_upload("#{Rails.root}/spec/models/cat.jpg") }

  describe 'POST /api/users/media_data' do
    it 'creates new media_datum with correct data' do
      params = {
          token: user.token,
          url: 'google.com',
          file: file
        }
      post '/api/users/media_data',  params
      expect(response).to be_success
      expect(json).to have_key('id')
    end
  end

  describe 'GET /api/users/:user_id/media_data' do
    before(:each) do
      15.times { FactoryGirl.create :random_media_datum }
    end

    it 'has correct responce' do
      get '/api/users/707/media_data'
      expect(response).to be_success
      expect(json).to have_key('media_data')
      media_datum = json['media_data'][0]
      expect(media_datum).to have_key('id')
      expect(media_datum).to have_key('url')
      expect(media_datum).to have_key('file')
    end
    it 'works with key based pagination' do
      get '/api/users/707/media_data', { limit: 10 }
      first_responce = json['media_data']
      last_seen_id = first_responce[9]['id']
      get '/api/users/707/media_data', { limit: 8, last_seen_id: last_seen_id }
      second_responce = json['media_data']
      expect(first_responce.size).to eq(10)
      expect(first_responce - second_responce).to match_array(first_responce)
      expect((first_responce + second_responce).size).to eq(15)
    end
  end

end
