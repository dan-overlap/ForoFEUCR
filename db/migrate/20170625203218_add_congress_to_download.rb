class AddCongressToDownload < ActiveRecord::Migration[5.1]
  def change
  	add_reference :downloads, :congress, foreign_key: true
  end
end
