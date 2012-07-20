class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :team_id
      t.string :address

      t.timestamps
    end
  end
end
