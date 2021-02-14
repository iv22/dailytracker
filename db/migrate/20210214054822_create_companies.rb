class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :name, limit: 180, null: false

      t.timestamps
    end
  end
end
