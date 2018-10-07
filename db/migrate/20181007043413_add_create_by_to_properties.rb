class AddCreateByToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :created_by, :integer
  end
end
