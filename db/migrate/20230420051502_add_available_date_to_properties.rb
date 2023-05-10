class AddAvailableDateToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :available_date, :datetime
  end
end
