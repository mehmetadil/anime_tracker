# frozen_string_literal: true

module Kitsu
  # Kitsu Anime Client
  class AnimeApi
    def self.index(params = nil)
      field_names = %w[canonicalTitle titles synopsis slug startDate endDate nextRelease status subtype
                       ageRating ageRatingGuide episodeCount episodeLength totalLength youtubeVideoId nsfw
                       coverImage posterImage]
      field_params = "?fields[anime]=#{field_names.join(',')}"
      pagination = '&page[limit]=5&page[offset]=0'
      path = 'anime/' + field_params + pagination
      response = JSON.parse(Kitsu::Adaptor.get(path))
      animes = response['data'].map { |anime| Kitsu::Serializer.new.anime(anime) }
      animes
    end
  end
end
