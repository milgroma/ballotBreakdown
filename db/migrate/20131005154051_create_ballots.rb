class CreateBallots < ActiveRecord::Migration
  def change
    create_table :ballots do |t|
      t.date :election_date
      t.string :state
      t.string :county
      t.string :city
      t.integer :ward
      t.integer :precinct

      t.timestamps
    end
  end
end
