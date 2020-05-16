# frozen_string_literal: true
module Kitsu
  # Kitsu Api Serializer
  class Serializer

    def anime(data)
      anime_columns = %i[canonical_title titles synopsis slug start_date end_date next_release status subtype
                       age_rating age_rating_guide episode_count episode_length total_length youtube_video_id kitsu_id nsfw]
      image_columns = %i[cover_image poster_image]
      data.deep_transform_keys! { |key| key.to_s.underscore.to_sym }
      data[:attributes][:kitsu_id] = data[:id]
      data[:attributes][:titles] = data[:attributes][:titles].map { |language, title| "#{language}??#{title}" }.join('::')

      anime = Anime.new data[:attributes].slice(*anime_columns)
      anime.images << set_images(data[:attributes].slice(*image_columns)).compact
      anime
    end

    private

    def set_images(images)
      image_sizes = %i[tiny small large original]
      images.map do |image_type, sizes|
        sizes&.slice(*image_sizes)&.map do |size, url|
          Image.new(image_type: image_type, size: size, url: url)
        end
      end
    end
  end
end