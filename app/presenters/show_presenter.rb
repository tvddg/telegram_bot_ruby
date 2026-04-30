class ShowCardBuilder
  def self.build(show)
    {
      text: build_text(show),
      image: show.image,
      send_type: show.image ? :photo : :text
    }
  end

  def self.build_text(show)
    [
      "🎬 #{show.name}",
      "⭐ #{show.rating || "—"}",
      "🎭 #{show.genres.join(' / ') || "-"}",
      "",
      shorten(show.summary)
    ].join("\n")
  end

  def self.shorten(text)
    return "No description" unless text
    text.length > 300 ? text[0..300] + "..." : text
  end
end