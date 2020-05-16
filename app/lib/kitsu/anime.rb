# frozen_string_literal: true

module Kitsu
  # Kitsu Anime Client
  class Anime
    def self.search(params = nil)
      field_names = ['synopsis', 'titles']
      field_params = "?fields[anime]=#{field_names.join(',')}"
      path = 'anime/' + field_params
      Kitsu::Adaptor.get(path)
    end
  end
end
