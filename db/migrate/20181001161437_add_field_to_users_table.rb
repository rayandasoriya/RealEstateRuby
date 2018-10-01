class AddFieldToUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_role, :string
  end
end
