class AddCategoryIdToPresentation < ActiveRecord::Migration[5.0]
  def change
  	add_reference :presentations, :category, foreign_key: true
  end
end
