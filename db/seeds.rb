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
#Profile.create!(:first_name=>"Yetter", :last_name=>"Bob")

user = User.create! :email => 'admin@admin.com', :password => 'password', :password_confirmation => 'password', :admin =>true
=======
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
<<<<<<< HEAD
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

user = User.create! :email => 'admin@admin.com', :password => 'password', :password_confirmation => 'password', :admin =>true
=======

user = User.create! :email => 'admin@admin.com', :password => 'password', :password_confirmation => 'password', :admin =>true

>>>>>>> 8d385ff952554a967b7cff71d37c26fb8d3d4cd8
>>>>>>> f9c8d253c78af4380a3321694e3f8f7201d4e9b3
