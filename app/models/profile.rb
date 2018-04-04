class Profile < ActiveRecord::Base
    mount_uploader :avatar, AvatarUploader
    
    before_create :normalize_phone
    
    def normalize_phone
       self.landline = self.landline.delete('^0-9')
       #Future work: Make a test suite (test cases of various formats of phone numbers), add hyphens/parentheses, and check for 7-digit or 10-digit number)
       #Also, check if there are any phone numbers with country code (+1, etc.) and consider handling that case
    end
end