class AddDenouncedByToComment < ActiveRecord::Migration[5.1]
  def change
  	add_column :comments, :denounced_by, :string, default: nil
  end
end
