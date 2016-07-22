#!groovy
node {
  stage 'checkout source and unit test'
  sh 'bundle install'
  sh 'bundle exec rake db:setup RAILS_ENV=test'
  sh 'bundle exec rubocop'
  sh 'bundle exec rake spec'
  stage 'deploy to vm'
  echo 'deploy to vm'
  stage 'load test'
  echo 'load test'
  stage 'cleanup'
  echo 'cleanup'
}
