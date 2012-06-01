class DropUsersAndTeamData < ActiveRecord::Migration
  def up
  	drop_table :team_data
  	drop_table :users
  end

  def down
  end
end
