class CreateTeamUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :team_users do |t|
      t.string :name
      t.integer :role, default: 0
      t.references :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end
