# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# This is how we are making the admin, an admin. Add with the same format if you would like to make a new admin.
# user = User.create! :email => 'mayflower-directory@protonmail.com', :password => 'IowaDynamiteTrucker1!', :password_confirmation => 'IowaDynamiteTrucker1!', :admin =>true

# These are the default library links
lirarylink = LibraryLink.create! :list_by_title => 'https://drive.google.com/file/d/1jluwHFk_KQ4wSf0OnX8Cg5-ujuCiq1g5/view?usp=sharing',
                                 :list_by_author => 'https://drive.google.com/file/d/1jluwHFk_KQ4wSf0OnX8Cg5-ujuCiq1g5/view?usp=sharing',
                                 :browing_collection => 'https://drive.google.com/file/d/1bEQCueAYYbPc4foTfqiV3yEXKM5AyXEh/view?usp=sharing'

require 'csv'
s3 = Aws::S3::Resource.new(
  region: 'us-east-2',
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
)


#Profile.create!(:first_name=>"Yetter", :last_name=>"Bob")


# INTAKE PROFILES

# IntakeProfile.create!(:first_name=>"Gary", :last_name=> "Elliot", :phone=>"443-564-3533", :waiver_signed=>true, :waiver_processed=>false, :bio_submitted=>false, :picture_submitted=>false, :profile_done=>false)

# IntakeProfile.create!(:first_name=>"Ellen", :last_name=> "Sanborn", :phone=>"443-564-0032", :waiver_signed=>true, :waiver_processed=>false, :bio_submitted=>true, :picture_submitted=>true, :profile_done=>false)

# IntakeProfile.create!(:first_name=>"Janet", :last_name=> "Hale", :phone=>"641-392-1900", :waiver_signed=>true, :waiver_processed=>true, :bio_submitted=>true, :picture_submitted=>false, :profile_done=>false)