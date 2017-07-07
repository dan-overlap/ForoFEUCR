class AddDescriptionToCongress < ActiveRecord::Migration[5.1]
  def change
  	add_column :congresses, :description, :text
  end
end
