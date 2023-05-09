class AddBrokerToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :broker, :boolean, default: false
  end
end
