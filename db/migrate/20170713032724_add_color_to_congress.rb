class AddColorToCongress < ActiveRecord::Migration[5.1]
  def change
  	add_column :congresses, :color, :string, default: '#ffffff'
  end
end
