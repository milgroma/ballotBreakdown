class AddColumnsToBallots < ActiveRecord::Migration
  def change
    add_column :ballots, :columns, :integer
  end
end
