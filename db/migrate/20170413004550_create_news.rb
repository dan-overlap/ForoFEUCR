class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.binary :image
      t.text :content
      t.integer :author

      t.timestamps
    end
  end
end
