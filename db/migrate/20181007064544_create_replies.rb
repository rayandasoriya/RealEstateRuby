class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.integer :query_id
      t.integer :user_id
      t.string :message
      t.timestamps
    end
  end
end
