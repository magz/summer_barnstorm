class AddSerializedAlternateNametoTeams < ActiveRecord::Migration
  def up
    add_column :teams, :alternate_names, :string
    add_column :teams, :tagline, :string
  end

  def down
    remove_column :teams, :alternate_names
    remove_column :teams, :tagline
  end
end
