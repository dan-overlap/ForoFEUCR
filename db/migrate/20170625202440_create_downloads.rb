class CreateDownloads < ActiveRecord::Migration[5.1]
  def change
    create_table :downloads do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
