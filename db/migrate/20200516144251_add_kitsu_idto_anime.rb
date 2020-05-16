class AddKitsuIdtoAnime < ActiveRecord::Migration[6.0]
  def change
    add_column :animes, :kitsu_id, :integer, after: :youtube_video_id
  end
end
