class CreatePresentations < ActiveRecord::Migration[5.0]
  def change
    create_table :presentations do |t|
      t.references :authors, foreign_key: true
      t.string :title
      t.string :abstract
      t.references :uploader, foreign_key: true
      t.binary :document
      t.integer :status
      t.integer :discussion
      t.integer :presenters
      t.integer :likes
      t.integer :dislikes
      t.timestamps
    end
  end
end
