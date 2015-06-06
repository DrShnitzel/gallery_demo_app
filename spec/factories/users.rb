FactoryGirl.define do
  factory :user do
    id 707
    email 'test@example.com'
    salt '$2a$10$Oc0iz6d7dGNdJaGP8hus8u'
    passwd 'password'
    passwd_hash '$2a$10$Oc0iz6d7dGNdJaGP8hus8u6mGIdfGXbHIUWbVzAw8vy6sLuU3Ddg2'
    token 'd31385e3-77e5-473a-8f9d-d09586eec32d'
  end

  factory :random_user, class: User do
    sequence(:id) { |n| n }
    sequence(:email) { Faker::Internet.email }
    salt '$2a$10$Oc0iz6d7dGNdJaGP8hus8u'
    passwd 'password'
    passwd_hash '$2a$10$Oc0iz6d7dGNdJaGP8hus8u6mGIdfGXbHIUWbVzAw8vy6sLuU3Ddg2'
    token { SecureRandom.uuid }
  end
end
