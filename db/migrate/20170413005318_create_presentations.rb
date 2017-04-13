class CreatePresentations < ActiveRecord::Migration[5.0]
  def change
    create_table :presentations do |t|
      t.references :authors, foreign_key: true
      t.string :title
      t.string :abstract
      t.references :uploader, foreign_key: true
      t.binary :document
      t.integer :status
      t.references :discussion, foreign_key: true
      t.references :presenters, foreign_key: true
      t.references :likes, foreign_key: true
      t.references :dislikes, foreign_key: true

      t.timestamps
    end
  end
end
