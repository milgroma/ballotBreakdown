class AddBallotLinkToBallots < ActiveRecord::Migration
  def change
    add_column :ballots, :officialBallot, :string
  end
end
