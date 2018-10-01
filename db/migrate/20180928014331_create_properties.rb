class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.string :address
      t.integer :size
      t.integer :style
      t.integer :price
      t.integer :floors
      t.boolean :basement
      t.string :owner
      t.integer :year_built
      t.timestamps
    end
  end
end
