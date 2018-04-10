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
s3 = Aws::S3::Resource.new(
  region: 'us-east-2',
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
)


#Profile.create!(:first_name=>"Yetter", :last_name=>"Bob")
