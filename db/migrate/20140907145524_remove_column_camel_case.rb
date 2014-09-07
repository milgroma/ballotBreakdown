class RemoveColumnCamelCase < ActiveRecord::Migration
  def change
    change_table :ballots do |t|
      t.rename :officialBallot, :official_ballot
      t.rename :ballotColumns, :ballot_columns
    end
    change_table :offices do |t|
      t.rename :ballotColumn, :ballot_column
      t.rename :simultaneousSeatholders, :simultaneous_seatholders
    end
  end
end
