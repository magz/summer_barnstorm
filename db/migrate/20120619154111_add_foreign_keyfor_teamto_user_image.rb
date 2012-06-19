class AddForeignKeyforTeamtoUserImage < ActiveRecord::Migration
  def up
  	add_column :user_uploaded_images, :team_id, :integer
  end

  def down
  	remove_column :user_uploaded_images, :team_id
  end
end
