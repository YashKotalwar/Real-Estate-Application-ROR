class AddTelephoneToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :telephone, :string
  end
end
