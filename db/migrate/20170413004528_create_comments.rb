class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :author, foreign_key: true
      t.string :title
      t.text :body
      t.references :replies, foreign_key: true
      t.references :likes, foreign_key: true
      t.references :dislikes, foreign_key: true
      t.boolean :is_important
      t.boolean :is_inappropriate
      t.boolean :reviewed
      t.boolean :denounced

      t.timestamps
    end
  end
end
