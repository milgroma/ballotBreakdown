class AddTermsToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :terms, :integer
  end
end
