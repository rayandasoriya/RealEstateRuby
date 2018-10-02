class AddImageToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :image, :string
  end
end
