require_relative 'toy_robot'

task :default => :migrate
desc "Run migrations"
task :migrate do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
end

# OLD RAKE FILE:
# task :default => [:test]
# task :test do
#   ruby "spec/toy_robot_spec.rb"
# end
