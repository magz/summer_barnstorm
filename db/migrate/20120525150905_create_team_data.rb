class CreateTeamData < ActiveRecord::Migration
  def change
    create_table :team_data do |t|
      t.string :color
      t.string :small_image
      t.integer :x_map_point
      t.integer :y_map_point

      t.timestamps
    end
  end
end
