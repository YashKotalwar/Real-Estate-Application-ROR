class AddDetailsToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :details, :text
  end
end
