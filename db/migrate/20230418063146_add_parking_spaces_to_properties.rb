class AddParkingSpacesToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :parking_spaces, :integer, default: 0
  end
end
