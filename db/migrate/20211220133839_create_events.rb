class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_title
      t.integer :genre_id
      t.integer :feel_id
      

      t.timestamps
    end
  end
end
