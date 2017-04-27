class AddUsernameToUser < ActiveRecord::Migration[5.0]
  def change

  	add_column :users, :username, :string
  	add_column :users, :user_id, :string, null: false, unique: true, default: 1
  end
end
