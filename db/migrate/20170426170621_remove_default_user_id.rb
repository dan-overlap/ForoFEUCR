class RemoveDefaultUserId < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :users, :user_id, nil
  end
end
