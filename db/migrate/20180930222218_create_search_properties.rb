class CreateSearchProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :search_properties do |t|
      t.integer :property_id
      t.string :address
      t.integer :size
      t.integer :price
      t.timestamps
    end
  end
end
