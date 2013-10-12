class OfficesPoliticiansJoinTable < ActiveRecord::Migration
  def change
    create_table :offices_politicians do |t|
      t.belongs_to :office
      t.belongs_to :politician
    end
  end
end
