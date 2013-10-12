class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :politician_id
      t.string :note
      t.integer :rank

      t.timestamps
    end
  end
end
