class AddNotNullConstraintsToCompanyUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :company_users, :company_id, false
    change_column_null :company_users, :user_id, false
  end
end
