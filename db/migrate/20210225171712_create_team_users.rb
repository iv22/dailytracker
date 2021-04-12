class CreateTeamUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :team_users do |t|
      t.references :user, foreign_key: true
      t.references :team, foreign_key: true
      t.boolean :is_team_lead, default: false
     
      t.timestamps null: false
    end
  end
end
