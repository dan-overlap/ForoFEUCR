class AddDefaultToCongress < ActiveRecord::Migration[5.1]
  def change
  	    add_column :congresses, :default, :boolean, default: false
  end
end
