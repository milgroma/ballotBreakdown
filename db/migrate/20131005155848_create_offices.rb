class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :tier
      t.string :office
      t.string :district
      t.string :territory
      t.string :term_limit

      t.timestamps
    end
  end
end
