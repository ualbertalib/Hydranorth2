require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'active_fedora/rake_support'

namespace :hydranorth do
  desc 'Run specs'
  RSpec::Core::RakeTask.new(:rspec) do |task|
    task.rspec_opts = ['--color', '--backtrace']
  end

  desc 'Run rubocop'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.requires << 'rubocop-rspec'
    task.fail_on_error = true
  end

  desc 'Run rubocop and specs for CI'
  task ci: :environment do
    Rake::Task['hydranorth:rubocop'].invoke
    with_test_server do
      Rake::Task['hydranorth:rspec'].invoke
    end
  end
end
