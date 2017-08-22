class AddPositionToDownload < ActiveRecord::Migration[5.1]
  def change
  	add_column :downloads, :position, :integer , default: '0'
  end
end
