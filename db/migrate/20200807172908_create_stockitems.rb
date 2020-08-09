class CreateStockitems < ActiveRecord::Migration[6.0]
  def change
    create_table :stockitems do |t|
      t.references :product, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.integer :quantities
      t.integer :flow

      t.timestamps
    end
  end
end
