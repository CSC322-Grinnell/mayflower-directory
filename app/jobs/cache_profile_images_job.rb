class CacheProfileImagesJob < ApplicationJob
  queue_as :default

  def perform
    puts "=== CACHING IMAGES ==="
    bucket = get_bucket

    Profile.all.each do |profile|
      profile.cached_picture_url = profile_image(profile, bucket)
      profile.save!
    end
    puts "=== DONE CACHING IMAGES ==="
  end

  after_perform do
    CacheProfileImagesJob.set(wait: 12.hours).perform_later
  end

  private

    def get_bucket
      s3 = Aws::S3::Resource.new(
        region: 'us-east-2',
        credentials: Aws::Credentials.new(
          ENV['AWS_ACCESS_KEY_ID'],
          ENV['AWS_SECRET_ACCESS_KEY']
        )
      )

      s3.bucket('mayflower-data')
    end

    def profile_image(profile, bucket)
      folder_name = "images"
      base_filename = "#{profile.last_name}, #{profile.first_name}"
      png_filename = "#{base_filename}.png"
      jpg_filename = "#{base_filename}.jpg"

      begin
        if not profile.avatar.file.nil?
          return profile.avatar.url
        elsif bucket.object(File.join(folder_name, jpg_filename)).exists?
          uploader = AvatarUploader.new
          uploader.retrieve_from_store!(jpg_filename)
          return uploader.url
        elsif bucket.object(File.join(folder_name, png_filename)).exists?
          uploader = AvatarUploader.new
          uploader.retrieve_from_store!(png_filename)
          return uploader.url
        else
          return nil
        end
      rescue Aws::S3::Errors::BadRequest
        return nil
      end
    end
end
