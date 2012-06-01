class CreateTeams < ActiveRecord::Migration
   def change
   create_table :teams do |t|
      t.string :color
      t.integer :x_map_point
      t.integer :y_map_point
      t.string :city
      t.string :team_name

      t.timestamps
   end
  end
end
