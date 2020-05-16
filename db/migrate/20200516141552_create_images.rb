class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :size
      t.string :image_type
      t.string :url
      t.integer :anime_id

      t.timestamps
    end
  end
end
