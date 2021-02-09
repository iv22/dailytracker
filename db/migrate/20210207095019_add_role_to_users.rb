# frozen_string_literal: true

# Add role column and index for User Model
class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :integer, null: false
    add_index :users, :role
  end
end
