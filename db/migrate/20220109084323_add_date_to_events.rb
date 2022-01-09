class AddDateToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :date, :date
    add_column :events, :conetnt, :text
    add_column :events, :place, :string
    add_column :events, :people, :integer


  end
end
