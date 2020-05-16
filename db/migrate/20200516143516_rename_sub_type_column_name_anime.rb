class RenameSubTypeColumnNameAnime < ActiveRecord::Migration[6.0]
  def change
    rename_column :animes, :sub_type, :subtype
  end
end
