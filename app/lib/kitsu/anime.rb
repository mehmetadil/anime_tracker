# frozen_string_literal: true

module Kitsu
  # Kitsu Anime Client
  class Anime
    def self.search(params = nil)
      field_names = %w[canonicalTitle titles synopsis slug startDate endDate nextRelease status subtype
                       ageRating ageRatingGuide episodeCount episodeLength totalLength youtubeVideoId nsfw
                       coverImage posterImage]
      field_params = "?fields[anime]=#{field_names.join(',')}"
      path = 'anime/' + field_params
      response = Kitsu::Adaptor.get(path)
    end
  end
end
