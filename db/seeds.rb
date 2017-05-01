# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
 
 csv_data = File.read('MayflowerDirectory1.csv')
 csv = CSV.parse(csv_data, :headers => true)
 csv.each do |row|
     row = row.to_hash.with_indifferent_access
     bob = row.to_hash.symbolize_keys
     Profile.create!(bob)
 end

<<<<<<< HEAD
#Profile.create!(:first_name=>"Yetter", :last_name=>"Bob")

user = User.create! :email => 'admin@admin.com', :password => 'password', :password_confirmation => 'password', :admin =>true
<<<<<<< HEAD
=======
#Profile.create!(:first_name=>"Yetter", :last_name=>"Bob")
>>>>>>> a1827af1a7d4ad2560b061b9be1bd0e3b677988a
=======
#Profile.create!(:first_name=>"Yetter", :last_name=>"Bob")
#Profile.create!(:first_name=>"Yetter", :last_name=>"Bob")

user = User.create! :email => 'admin@admin.com', :password => 'password', :password_confirmation => 'password', :admin =>true
>>>>>>> testing
