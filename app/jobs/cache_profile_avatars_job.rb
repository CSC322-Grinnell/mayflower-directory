class CacheProfileAvatarsJob < ApplicationJob
  queue_as :default

  def perform
    cache_service = CacheProfileAvatarService.new
    Profile.all.each do |profile|
      cache_service.refresh!(profile)
    end
  end

  after_perform do
    CacheProfileAvatarsJob.set(wait: 12.hours).perform_later
  end
end
