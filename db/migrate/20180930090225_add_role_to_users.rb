class AddRoleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_hunter, :boolean
    add_column :users, :is_realtor, :boolean
  end
end
