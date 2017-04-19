Given /the following profiles exist/ do |profiles_table|
  profiles_table.hashes.each do |profile|
  	Profile.create!(profile)
  end
end