class Anime < ApplicationRecord
  has_many :images, dependent: :destroy
end
