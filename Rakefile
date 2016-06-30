# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'solr_wrapper/rake_task'
require 'fcrepo_wrapper/rake_task'
require 'collection_north/tasks/collection_north_tasks'
require 'collection_north/engine'
