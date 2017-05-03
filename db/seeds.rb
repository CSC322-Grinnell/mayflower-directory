# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# This is how we are making the admin, an admin. Add with the same format if you would like to make a new admin.
user = User.create! :email => 'admin@admin.com', :password => 'password', :password_confirmation => 'password', :admin =>true


require 'csv'
 
 csv_data = File.read('MayflowerDirectory1.csv')
 csv = CSV.parse(csv_data, :headers => true)
 csv.each do |row|
     row = row.to_hash.with_indifferent_access
     bob = row.to_hash.symbolize_keys
     Profile.create!(bob)
 end

csv_data = File.read('MayflowerEmailPw.csv')
 csv = CSV.parse(csv_data, :headers => true)
 csv.each do |row|
     row = row.to_hash.with_indifferent_access
     bob = row.to_hash.symbolize_keys
     User.create!(bob)
 end

#Profile.create!(:first_name=>"Yetter", :last_name=>"Bob")
