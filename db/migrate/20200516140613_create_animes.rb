class CreateAnimes < ActiveRecord::Migration[6.0]
  def change
    create_table :animes do |t|
      t.string :canonical_title
      t.string :titles
      t.text :synopsis
      t.string :slug
      t.date :start_date
      t.date :end_date
      t.string :next_release
      t.string :status
      t.string :sub_type
      t.string :age_rating
      t.string :age_rating_guide
      t.string :episode_count
      t.string :episode_length
      t.string :total_length
      t.string :youtube_video_id
      t.boolean :nsfw

      t.timestamps
    end
  end
end
