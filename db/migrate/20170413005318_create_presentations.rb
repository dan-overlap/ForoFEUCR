class CreatePresentations < ActiveRecord::Migration[5.0]
  def change
    create_table :presentations do |t|
      t.integer :authors
      t.string :title
      t.string :abstract
      t.integer :uploader
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
