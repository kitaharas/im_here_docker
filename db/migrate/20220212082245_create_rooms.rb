class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :to_user, foreign_key: {to_table: :users}
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
