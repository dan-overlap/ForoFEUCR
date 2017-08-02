class ChangeDefaultColorToEvent < ActiveRecord::Migration[5.1]
  def change
  	change_column :events, :color, :string, default: '#003f66'
  end
end
