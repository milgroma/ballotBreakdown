class RenameColumnsColumns < ActiveRecord::Migration
  def change
    rename_column :ballots, :columns, :ballotColumns
    rename_column :offices, :column, :ballotColumn
  end
end
