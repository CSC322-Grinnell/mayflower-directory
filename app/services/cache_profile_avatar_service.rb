class CacheProfileAvatarService
  def initialize
    s3 = Aws::S3::Resource.new(
      region: ENV['AWS_DEFAULT_REGION'],
      credentials: Aws::Credentials.new(
        ENV['AWS_ACCESS_KEY_ID'],
        ENV['AWS_SECRET_ACCESS_KEY']
      )
    )

    @bucket = s3.bucket('mayflower-data')
  end

  def refresh!(profile)
    profile.cached_avatar_url = retrieve_for_profile(profile)
    profile.save!
  end

  private

    def new_uploader
      AvatarUploader.new
    end

    def file_exists?(filename)
      @bucket.object(File.join(new_uploader.store_dir, filename)).exists?
    end

    def retrieve(filename)
      uploader = new_uploader
      uploader.retrieve_from_store!(filename)
      uploader.url
    end

    def retrieve_for_profile(profile)
      if not profile.avatar.file.nil?
        profile.avatar.url
      else
        begin
          base_filename = "#{profile.last_name}, #{profile.first_name}"
          png_filename = "#{base_filename}.png"
          jpg_filename = "#{base_filename}.jpg"

          if file_exists?(jpg_filename)
            retrieve(jpg_filename)
          elsif file_exists?(png_filename)
            retrieve(png_filename)
          else
            nil
          end
        rescue Aws::S3::Errors::BadRequest
          nil
        end
      end
    end

end
