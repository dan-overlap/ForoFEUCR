class AddUserAndCongressToEvent < ActiveRecord::Migration[5.0]
  def change
  	add_reference :events, :congress, foreign_key: true
  	add_reference :events, :user, foreign_key: true
  end
end
