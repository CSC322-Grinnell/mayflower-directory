class Profile < ActiveRecord::Base
    mount_uploader :avatar, AvatarUploader
    
    before_create :normalize_phone
    
    def normalize_phone
       self.landline.delete('^0-9')
    end
end