class CreateTeamData < ActiveRecord::Migration
  def change
    create_table :team_data do |t|
      t.string :color
      t.string :small_image
      t.int :x_map_point
      t.int :y_map_point

      t.timestamps
    end
  end
end
