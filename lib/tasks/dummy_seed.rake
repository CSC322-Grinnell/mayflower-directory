namespace :db do
  desc "Seed database with dummy data for development, based on the file `db/dummy_seed.rb`"
  filename = Rails.root.join('db', 'dummy_seed.rb')
  task :dummy_seed => :environment do
    load(filename) if File.exist?(filename)
  end
end
