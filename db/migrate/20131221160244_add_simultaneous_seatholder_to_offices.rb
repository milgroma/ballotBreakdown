class AddSimultaneousSeatholderToOffices < ActiveRecord::Migration
  def change
    add_column :offices, :simultaneousSeatholders, :integer
  end
end
