require 'rails_helper'

RSpec.describe MediaDatum, type: :model do
  let(:file) { File.open("#{Rails.root}/spec/models/cat.jpg") }

  describe 'odject' do
    it 'is valid with correct data' do
      media_datum = MediaDatum.new(user_id: 1, url: 'https://bondstreet.ru', file: file)
      expect(media_datum).to be_valid
    end
    it 'is invalid with incorrect url' do
      media_datum = MediaDatum.new(user_id: 1, url: '1ht@@ndstreetru', file: file)
      expect{media_datum.valid?}.to raise_error(ActiveModel::StrictValidationFailed)
    end
    it 'is invalid without url' do
      media_datum = MediaDatum.new(user_id: 1, file: file)
      expect{media_datum.valid?}.to raise_error(ActiveModel::StrictValidationFailed)
    end
    it 'is invalid without file' do
      media_datum = MediaDatum.new(user_id: 1, url: 'https://bondstreet.ru')
      expect{media_datum.valid?}.to raise_error(ActiveModel::StrictValidationFailed)
    end
      it 'is invalid without user_id' do
      media_datum = MediaDatum.new(url: 'https://bondstreet.ru', file: file)
      expect{media_datum.valid?}.to raise_error(ActiveModel::StrictValidationFailed)
    end
  end
end
