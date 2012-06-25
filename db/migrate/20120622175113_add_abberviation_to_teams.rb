class AddAbberviationToTeams < ActiveRecord::Migration
  def up
  	add_column :teams, :abbreviation, :string
  end

  def down
  	remove_column :teams, :abbreviation
  end
end
