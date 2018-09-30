class CreateQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :queries do |t|
      t.integer :user_id
      t.integer :property_id
      t.string :subject
      t.text :message
      t.timestamps
    end
  end
end
