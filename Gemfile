source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'

###############################################################
# Backend gems																								#
###############################################################
# Use koala as a Facebook library
gem "koala", "~> 2.2"
# Use Pundit for authorization
gem 'pundit'
# Paranoia for logical exclusion of models
gem 'paranoia'
# Use carrierwave to upload files
gem 'carrierwave'
# Use mini_magick for image processing (used by carrierwave uploading)
gem 'mini_magick'
# Use audited to keep track of Active Record updates
# gem 'audited-activerecord', '~> 4.0'
# Use serializers to standartize json objects returned to users
gem 'active_model_serializers'
# Use kaminari to paginate objects
gem 'kaminari'
# Devise for user authentication
gem 'devise'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Rack Middleware for handling Cross-Origin Resource Sharing (CORS), which makes cross-origin AJAX possible.
  gem 'rack-cors', :require => 'rack/cors'
end

# group :production do
#   # Call 'byebug' anywhere in the code to stop execution and get a debugger console
#   gem 'passenger'
# end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
