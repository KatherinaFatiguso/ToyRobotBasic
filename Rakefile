require_relative 'toy_robot'
require 'active_record'

task :default => [:dropdb, :createdb, :migrate]
desc "Drop database"
task :dropdb do
  ActiveRecord::Tasks::DatabaseTasks.drop_all
end

desc "Create database"
task :createdb do
  `createdb toyrobotdb_development`
end

desc "Migrate database"
task :migrate do
  ActiveRecord::Migrator.migrate("db/migrate/")
end
