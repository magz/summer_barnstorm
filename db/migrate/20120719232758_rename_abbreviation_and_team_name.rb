class RenameAbbreviationAndTeamName < ActiveRecord::Migration
  def self.up
    rename_column :teams, :team_name, :name
  end

  def self.down
    rename_column :teams, :team_name, :name
  end
end
