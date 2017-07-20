class AddUniquenessToUserId < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :user_id, :string, null: false, unique: true
  end
end
