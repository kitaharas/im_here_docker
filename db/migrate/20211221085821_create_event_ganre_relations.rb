class CreateEventGanreRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :event_ganre_relations do |t|
      t.integer :event_id
      t.integer :ganre_id

      t.timestamps
    end
  end
end
