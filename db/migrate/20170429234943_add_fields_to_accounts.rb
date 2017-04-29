class AddFieldsToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :email, :string, index: true
    add_column :accounts, :password_digest, :string
  end
end
