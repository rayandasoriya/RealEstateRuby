class CreateSearchProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :search_properties do |t|
      t.integer :property_id
      t.string :address
      t.string :size
      t.string :price
      t.timestamps
    end
  end
end
