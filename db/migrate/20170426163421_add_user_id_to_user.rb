class AddUserIdToUser < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :username, :string, null: false
  	add_column :users, :user_id, :string, null: false, unique: true, default: "A62603"
  end
end
