class AddGanreIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :ganre_id, :integer
  end
end
