class RemoveUnusedTables < ActiveRecord::Migration
  def up
  	drop_table :users
  	drop_table :team_data
  end

  def down
  end
end
