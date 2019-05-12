class CacheProfileImagesJob < ApplicationJob
  queue_as :default

  def self.refresh_profile!(profile, uploader = AvatarUploader.new)
    profile.cached_picture_url = uploader.retrieve_for_profile!(profile)
    profile.save!
  end

  def perform
    uploader = AvatarUploader.new
    Profile.all.each do |profile|
      CacheProfileImagesJob.refresh_profile!(profile, uploader)
    end
  end

  after_perform do
    CacheProfileImagesJob.set(wait: 12.hours).perform_later
  end
end
