# frozen_string_literal: true

module Kitsu
  # Kitsu Anime Client
  class AnimeApi
    class << self
      def index(q: '', limit: 10, offset: 0)
        fields = %w[canonicalTitle titles synopsis slug startDate endDate nextRelease status subtype
                    ageRating ageRatingGuide episodeCount episodeLength totalLength youtubeVideoId nsfw
                    coverImage posterImage]

        path = 'anime/' + field_params(fields) + pagination(limit, offset) + text_param(q)
        response = JSON.parse(Kitsu::Adaptor.get(path))
        response['data'].map { |anime| Kitsu::Serializer.new.anime(anime) }
      end

      private

      def field_params(fields)
        "?fields[anime]=#{fields.join(',')}"
      end

      def pagination(limit, offset = 0)
        "&page[limit]=#{limit}&page[offset]=#{offset}"
      end

      def text_param(text)
        "&filter[text]=#{text}"
      end
    end
  end
end
