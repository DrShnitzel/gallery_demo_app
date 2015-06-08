source 'https://rubygems.org'

gem 'rails', '4.2.1'
# API don't need all rails features, still I prefer rails to sinatra
# because for me it is easier to remove unused, than to add
# all I need. This gem helps to make rails lighter.
gem 'rails-api'
# I use puma because it's pretty fast( I haven't tried Raptor yet)
# and it is even more faster with rubinius or jruby because it benefits
# from their ability to use real threads.
gem 'puma'
# Do not keep secrets in repo
gem 'dotenv-rails'
# Colorful irb replacement. Everything is better with colors!
gem 'pry-rails'
gem 'jbuilder'
# I use it for auth
gem 'bcrypt'
gem 'carrierwave'
gem 'faker'
gem 'pg'

group :test do
  gem 'rspec-rails'
  gem 'factory_girl'
end

group :development do
  gem 'spring'
  gem 'capistrano3-puma'
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-rails'
end

group :production do
  gem 'therubyracer',  platforms: :ruby
end
