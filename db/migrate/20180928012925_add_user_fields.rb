class AddUserFields < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :is_admin, :boolean
    add_column :users, :contact_method, :integer
    add_column :users, :is_hunter, :boolean
    add_column :users, :is_realtor, :boolean
  end
end
