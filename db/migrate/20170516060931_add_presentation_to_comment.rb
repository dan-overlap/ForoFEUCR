class AddPresentationToComment < ActiveRecord::Migration[5.0]
  def change
  	add_reference :comments, :presentation, foreign_key: true
  end
end
