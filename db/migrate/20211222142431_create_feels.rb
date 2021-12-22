class CreateFeels < ActiveRecord::Migration[5.2]
  def change
    create_table :feels do |t|
      t.string :feel_title

      t.timestamps
    end
  end
end

