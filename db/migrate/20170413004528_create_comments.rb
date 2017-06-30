class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :author
      t.string :title
      t.text :body
      t.integer :replies
      t.integer :likes
      t.integer :dislikes
      t.boolean :is_important
      t.boolean :is_inappropriate
      t.boolean :reviewed
      t.boolean :denounced

      t.timestamps
    end
  end
end
