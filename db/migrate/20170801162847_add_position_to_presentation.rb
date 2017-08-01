class AddPositionToPresentation < ActiveRecord::Migration[5.1]
  def change
  	add_column :presentations, :position, :integer , default: '0'
  end
end
