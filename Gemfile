source 'https://rubygems.org'

# semantically-meaningful name for OS-specific gems
def os_is(re)
  RbConfig::CONFIG['host_os'] =~ re
end

# Need to point sufia to a github branch for hotfixes as a gem was never cut after 7.2
gem 'sufia', git: 'https://github.com/projecthydra/sufia.git', branch: '7.2-migration'

# hidden Sufia dependencies below
# Sufia pushes flipflop on the app as its not an actual gem, should PR this back somehow?
gem 'flipflop', git: 'https://github.com/jcoyne/flipflop.git', branch: 'hydra'
gem 'jbuilder', '~> 2.0' # Hidden Sufia Dependencies...Need PR against sufia...
# gem 'rsolr', '~> 1.0' # Do we need this? Comment it out for now

# fail on sufia 7.2...they have a lose dependency on CC...which is breaking if it jumps to a higher version
gem 'curation_concerns', '1.6.3'

gem 'solrizer', git: 'https://github.com/mbarnett/solrizer.git', branch: 'solrizable_path_types'

gem 'blacklight-hierarchy'

gem 'devise'
gem 'omniauth'
# gem 'devise-guests', '~> 0.3'
gem 'omniauth-shibboleth'
gem 'rolify'

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
  gem 'capybara'
  # gem 'capybara-screenshot'
  # gem 'poltergeist'
  gem 'database_cleaner'
  gem 'shoulda-matchers'

  gem 'coffee-rails' # Hidden Sufia Dependencies...Need PR against sufia...
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry', '~> 0.10.4'

  gem 'fcrepo_wrapper'
  gem 'solr_wrapper', '>= 0.3'

  gem 'factory_girl_rails'
  gem 'rspec-rails'

  gem 'coveralls', require: false
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false

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

  # fixes an issue I'm experiencing locally, and I'd rather have the solution documented here rather than go on a
  # fishing expedition if I set up a new gemset or my machine spontaneously combusts. Related to
  # https://github.com/rails/rails/issues/26658 TODO: re-evealuate on next Ruby update -- MB
  gem 'rb-readline', platforms: :ruby, install_if: os_is(/darwin/)
end
