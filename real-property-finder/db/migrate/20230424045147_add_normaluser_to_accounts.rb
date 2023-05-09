class AddNormaluserToAccounts < ActiveRecord::Migration[7.0]
  def change
    add_column :accounts, :normaluser, :boolean, default: true
  end
end
