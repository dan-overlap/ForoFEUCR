class ChangeInappropriateDefault < ActiveRecord::Migration[5.1]
  def change
  	change_column :comments, :is_inappropriate, :boolean, :default => false
  end
end
