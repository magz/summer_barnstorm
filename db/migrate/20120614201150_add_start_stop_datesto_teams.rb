class AddStartStopDatestoTeams < ActiveRecord::Migration
  def up
  	add_column :teams, :promo_start_date, :datetime 
 	add_column :teams, :promo_end_date, :datetime 

  end

  def down
  	remove_column :teams, :promo_start_date
 	remove_column :teams, :promo_end_date

  end
end
