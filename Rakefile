require_relative 'toy_robot'

task :default =>[:dbsetup, :migrate, :test]

desc "Drop and create database"
task :dbsetup do
  `dropdb toyrobotdb_development; true`
  `createdb toyrobotdb_development`
end

desc "Run migrations"
task :migrate do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
end

desc "Run tests"
task :test do
  ruby "spec/toy_robot_spec.rb"
end
