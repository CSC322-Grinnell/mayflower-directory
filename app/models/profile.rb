require 'csv'

class Profile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  # include the whitespace in between first name and last name for search
  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new('||',
      Arel::Nodes::InfixOperation.new('||',
        parent.table[:first_name], Arel::Nodes.build_quoted(' ')
      ),
      parent.table[:last_name]
    )
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Profile.create!(row.to_hash)
    end
  end
end

