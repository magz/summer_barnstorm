class AddTeam1AndTeam2StringsToUserUploadedImage < ActiveRecord::Migration
  def up
  	add_column :user_uploaded_images, :team1, :string
  	add_column :user_uploaded_images, :team2, :string

  end
  def down
  	remove_column :user_uploaded_images, :team1
  	remove_column :user_uploaded_images, :team2

  end
end
