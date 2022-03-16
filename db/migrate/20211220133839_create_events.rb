class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_title
      t.integer :user_id
      t.integer :genre_id
      t.integer :feel_id
      t.string  :date
      t.text :content
      t.string  :place
      t.integer :people
      t.string :event_image_name
      
      t.timestamps
    end
  end
end
