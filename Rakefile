# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

require 'coveralls/rake/task'
Coveralls::RakeTask.new
task :test_with_coveralls => ["test", "coveralls:push"]
Rails.application.load_tasks


