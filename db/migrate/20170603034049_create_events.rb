class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :ending_date
      t.time :start_time

      t.timestamps
    end
  end
end
