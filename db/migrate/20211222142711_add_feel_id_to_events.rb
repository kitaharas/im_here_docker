class AddFeelIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :feel_id, :integer
  end
end

