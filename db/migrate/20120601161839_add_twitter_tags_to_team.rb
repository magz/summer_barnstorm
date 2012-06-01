class AddTwitterTagsToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :twitter_tags, :string
  end
end
