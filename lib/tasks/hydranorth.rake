require 'rspec/core'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'active_fedora/rake_support'

namespace :hydranorth do
  desc 'Run specs'
  RSpec::Core::RakeTask.new(:rspec) do |t|
    t.rspec_opts = ['--color', '--backtrace']
  end

  desc 'Run rubocop'
  RuboCop::RakeTask.new(:rubocop) do |task|
    # task.requires << 'rubocop-rspec'
    task.fail_on_error = true
  end

  desc 'Run unit tests on Travis'
  task ci: :environment do
    Rake::Task['hydranorth:rubocop'].invoke
    with_test_server do
      Rake::Task['hydranorth:rspec'].invoke
    end
  end
end
