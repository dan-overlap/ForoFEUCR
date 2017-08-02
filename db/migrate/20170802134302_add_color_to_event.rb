class AddColorToEvent < ActiveRecord::Migration[5.1]
  def change
  	add_column :events, :color, :string, default: '#8c3000'
  end
end
