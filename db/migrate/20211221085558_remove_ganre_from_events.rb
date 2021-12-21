class RemoveGanreFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :ganre, :integer
  end
end
