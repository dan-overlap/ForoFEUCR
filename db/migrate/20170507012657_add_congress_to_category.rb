class AddCongressToCategory < ActiveRecord::Migration[5.0]
  def change
  	add_reference :categories, :congress, foreign_key: true
  end
end
