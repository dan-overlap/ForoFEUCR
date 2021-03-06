class CreateCongresses < ActiveRecord::Migration[5.0]
  def change
    create_table :congresses do |t|
      t.string :name
      t.string :organizer
      t.integer :responsible
      t.integer :calendar
      t.integer :blog
      t.integer :categories
      t.integer :administrators

      t.timestamps
    end
  end
end
