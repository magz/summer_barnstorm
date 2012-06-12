class ChangeTeamMapPointsToFloats < ActiveRecord::Migration
  def up
  	change_column :teams, :x_map_point, :float
 	change_column :teams, :y_map_point, :float

  end

  def down
  	change_column :teams, :x_map_point, :integer
 	change_column :teams, :y_map_point, :integer

  end
end
