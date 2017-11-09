class Profile < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end
