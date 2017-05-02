class CreateExpositions < ActiveRecord::Migration[5.0]
  def change
    create_table :expositions do |t|
      t.integer :presentation_id
      t.integer :presenter_id

      t.timestamps
    end
  end
end
