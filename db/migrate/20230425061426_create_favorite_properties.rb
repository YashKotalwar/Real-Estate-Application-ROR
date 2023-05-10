class CreateFavoriteProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_properties do |t|
      t.references :account, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end