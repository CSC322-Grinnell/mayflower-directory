module ProfilesHelper
  def full_name(profile)
    if profile.nickname.present?
      "#{profile.nickname} #{profile.last_name} (#{profile.first_name})"
    else
      "#{profile.first_name} #{profile.last_name}"
    end
  end

  def avatar_url(profile)
    profile.cached_avatar_url or image_url("default_avatar.jpg")
  end

  def normalize_line_breaks(text)
    text.strip.gsub(/\s*\n\s*/, "\n").gsub(/\n+/, "\n\n")
  end
end
