class AddVoterToBallots < ActiveRecord::Migration
  def change
    add_column :ballots, :voter_id, :integer
  end
end
