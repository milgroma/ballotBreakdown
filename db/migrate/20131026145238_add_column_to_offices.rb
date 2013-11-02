class AddColumnToOffices < ActiveRecord::Migration
  def change
    add_column :offices, :column, :integer
  end
end
