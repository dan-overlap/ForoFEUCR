class CreateCongresses < ActiveRecord::Migration[5.0]
  def change
    create_table :congresses do |t|
      t.string :name
      t.string :organizer
      t.references :responsible, foreign_key: true
      t.references :calendar, foreign_key: true
      t.references :blog, foreign_key: true
      t.references :categories, foreign_key: true
      t.references :administrators, foreign_key: true

      t.timestamps
    end
  end
end
