# frozen_string_literal: true

module Kitsu
  # Kitsu Adaptor
  class Adaptor
    API_ENDPOINT = 'https://kitsu.io/api/edge/'

    def self.get(path)
      end_point = API_ENDPOINT + path
      uri = URI(end_point)

      Net::HTTP.get(uri)
    end
  end
end