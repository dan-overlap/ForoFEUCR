class CreateDiscussions < ActiveRecord::Migration[5.0]
  def change
    create_table :discussions do |t|
      t.integer :comments
      t.integer :amount_comments

      t.timestamps
    end
  end
end
