class AddAdminToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :admin, :boolean
  end
end
