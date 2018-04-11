class Profile < ActiveRecord::Base
    mount_uploader :avatar, AvatarUploader
    require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Profile.create!(row.to_hash)
    end # end CSV.foreach
  end # end self.import(file)
end

