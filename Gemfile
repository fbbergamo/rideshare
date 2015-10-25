source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
gem 'pg'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'dotenv-rails'
gem 'active_model_serializers'
gem "responders"
gem "redis"
gem  "geohash", github: "harn/redis-geohash"

# Use Unicorn as the app server
# gem 'unicorn'

group  :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem "rubycritic", :require => false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'byebug'
  gem 'web-console', '~> 2.0'
end
