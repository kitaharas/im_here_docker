class CreateGanres < ActiveRecord::Migration[5.2]
  def change
    create_table :ganres do |t|
      t.integer :ganre_id
      t.string :genre_title

      t.timestamps
    end
  end
end
