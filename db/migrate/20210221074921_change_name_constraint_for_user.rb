class ChangeNameConstraintForUser < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:users, :first_name, from: "", to: nil)
    change_column_default(:users, :last_name, from: "", to: nil)
  end
end
