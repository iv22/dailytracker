class AddPhoneToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :string, limit: 20
  end
end
