class CreateAdministrations < ActiveRecord::Migration[5.0]
  def change
    create_table :administrations do |t|
      t.references :congress, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
