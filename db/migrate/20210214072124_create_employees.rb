class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.integer :company_id
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :employees, :companies
    add_foreign_key :employees, :users
    add_index :employees, :user_id, unique: true
  end
end
