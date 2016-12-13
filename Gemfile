source 'https://rubygems.org'

gem 'sufia', '~> 7.2.0'
# Hidden Sufia Dependencies
gem 'flipflop', git: 'https://github.com/jcoyne/flipflop.git', branch: 'hydra'
gem 'jbuilder', '~> 2.0' # Hidden Sufia Dependencies...Need PR against sufia...
# gem 'rsolr', '~> 1.0'
gem 'devise'
# gem 'devise-guests', '~> 0.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use sqlite3 as the database for Active Record
gem 'mysql2'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

group :test do
  gem 'coffee-rails' # Hidden Sufia Dependencies...Need PR against sufia...
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'fcrepo_wrapper'
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'solr_wrapper', '>= 0.3'
  if ENV['LOCAL_COLLECTION_NORTH_PATH']
    gem 'collection_north', path: ENV['LOCAL_COLLECTION_NORTH_PATH']
  else
    gem 'collection_north', git: 'https://github.com/ualbertalib/CollectionNorth.git'
  end
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'spring'
  # Spring dependencies
  gem 'listen', '~> 3.0.5'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
