module ProfilesHelper
  def normalize_line_breaks(text)
    text.gsub(/\r\n/, "\n").gsub(/\n+/, "\n\n")
  end
end
