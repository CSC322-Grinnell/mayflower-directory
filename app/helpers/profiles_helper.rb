module ProfilesHelper
  def full_name(profile)
    if profile.nickname.present?
      "#{profile.nickname} #{profile.last_name} (#{profile.first_name})"
    else
      "#{profile.first_name} #{profile.last_name}"
    end
  end

  def picture_url(profile)
    profile.cached_picture_url or image_url("default_profile_photo.jpg")
  end

  def normalize_line_breaks(text)
    text.strip.gsub(/\s*\n\s*/, "\n").gsub(/\n+/, "\n\n")
  end
end
