class Profile < ActiveRecord
  mount_uploader :avatar, AvatarUploader
end
