module ProfilesHelper
  def full_name(profile)
    "#{profile.last_name}, #{profile.first_name}"
  end

  def picture_url(profile)
    profile.cached_picture_url or image_url("Mayflower_Default_Photo.jpg")
  end
end
