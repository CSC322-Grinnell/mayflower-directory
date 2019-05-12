class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog

  def initialize(*args)
    super
    s3 = Aws::S3::Resource.new(
      region: ENV['AWS_DEFAULT_REGION'],
      credentials: Aws::Credentials.new(
        ENV['AWS_ACCESS_KEY_ID'],
        ENV['AWS_SECRET_ACCESS_KEY']
      )
    )

    @bucket = s3.bucket('mayflower-data')
  end

  def file_exists?(filename)
    @bucket.object(File.join(store_dir, filename)).exists?
  end

  def retrieve_for_profile!(profile)
    if not profile.avatar.file.nil?
      profile.avatar.url
    else
      begin
        base_filename = "#{profile.last_name}, #{profile.first_name}"
        png_filename = "#{base_filename}.png"
        jpg_filename = "#{base_filename}.jpg"

        if file_exists?(jpg_filename)
          retrieve_from_store!(jpg_filename)
          url
        elsif file_exists?(png_filename)
          retrieve_from_store!(png_filename)
          url
        else
          nil
        end
      rescue Aws::S3::Errors::BadRequest
        nil
      end
    end
  end

  # Override the directory where uploaded files will be stored.
  def store_dir
    'images'
  end

  def cache_dir
    'images'
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  #more whitelisting so only images get uploaded to the AWS
  def content_type_whitelist
    /image\//
  end

  # blacklisting some stuff thats not images
  def content_type_blacklist
    ['application/text', 'application/json']
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
