class RenameGenreTitleColomnToGanres < ActiveRecord::Migration[5.2]
  def change
    rename_column :ganres, :genre_title, :ganre_title
  end
end
