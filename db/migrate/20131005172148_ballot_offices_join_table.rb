class BallotOfficesJoinTable < ActiveRecord::Migration
  def change
    create_table :ballots_offices do |t|
      t.belongs_to :ballot
      t.belongs_to :office
    end
  end
end
