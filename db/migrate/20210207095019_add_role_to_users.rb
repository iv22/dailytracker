# frozen_string_literal: true

class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE user_role AS ENUM ('manager', 'master', 'employee' );
    SQL
    add_column :users, :role, :user_role
    add_index :users, :role
  end

  def down
    remove_column :users, :role
    execute <<-SQL
      DROP TYPE user_role;
    SQL
  end
end
