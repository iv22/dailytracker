class AddOnDeleteConstraints < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :company_users, :users
    add_foreign_key :company_users, :users, on_delete: :cascade

    remove_foreign_key :company_users, :companies
    add_foreign_key :company_users, :companies, on_delete: :cascade
  end
end
