class AddCongressToBanner < ActiveRecord::Migration[5.1]
  def change
  	add_reference :banners, :congress, foreign_key: true
  end
end
