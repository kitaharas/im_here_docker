class AddGanreToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :ganre, :integer
  end
end
