class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :street
      t.string :neighborhood
      t.string :city
      t.integer :cep

      t.timestamps
    end
  end
end
