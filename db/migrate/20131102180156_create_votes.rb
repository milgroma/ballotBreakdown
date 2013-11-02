class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voter_id
      t.integer :ballot_id
      t.integer :office_id
      t.integer :politician_id

      t.timestamps
    end
  end
end
