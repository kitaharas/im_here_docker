class RenameConetntColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :conetnt, :content
  end
end
