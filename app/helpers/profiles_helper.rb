module ProfilesHelper
  def normalize_line_breaks(text)
    text.strip.gsub(/\s*\n\s*/, "\n").gsub(/\n+/, "\n\n")
  end
end
