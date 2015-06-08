FactoryGirl.define do

  factory :random_media_datum, class: MediaDatum do
    sequence(:id, 1000) { |n| n }
    sequence(:url) { Faker::Internet.url }
    file  Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/models/cat.jpg"))
    user_id 707
  end
end
