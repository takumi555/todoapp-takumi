class AddColumnToTask < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :board, null: false
  end
end
