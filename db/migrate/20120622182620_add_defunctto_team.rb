class AddDefuncttoTeam < ActiveRecord::Migration
  def up
  	add_column :teams, :defunct, :boolean
  end

  def down
  	remove_column :teams, :defunct
  end
end
