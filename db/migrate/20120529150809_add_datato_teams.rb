class AddDatatoTeams < ActiveRecord::Migration
  def up
  	change_table :team_data do |t|
  		t.string :city
  		t.string :team_name
  	end

  end

  def down
  	remove_column :team_data, :city
  	remove_column :team_data, :team_name
  end
end
