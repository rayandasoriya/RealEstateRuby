class RemoveUserAndAddCompanyToProperty < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :user_id
    add_column :properties, :company_id, :integer
  end
end