class RemoveGanreIdFromGanres < ActiveRecord::Migration[5.2]
  def change
    remove_column :ganres, :ganre_id, :integer
  end
end
