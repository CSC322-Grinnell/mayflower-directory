# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
 
 csv_data = File.read('sample_db.csv')
 csv = CSV.parse(csv_data, :headers => true)
 csv.each do |row|
     row = row.to_hash.with_indifferent_access
     bob = row.to_hash.symbolize_keys
     Profile.create!(bob)
 end

<<<<<<< HEAD
#Profile.create!(:first_name=>"Yetter", :last_name=>"Bob")
=======
#Profile.create!(:first_name=>"Yetter", :last_name=>"Bob")

user = User.create! :email => 'admin@admin.com', :password => 'password', :password_confirmation => 'password', :admin =>true
>>>>>>> eb71c8ef0e2789fafe6afd1a62b33db34c7db184
