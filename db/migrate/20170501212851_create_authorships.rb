class CreateAuthorships < ActiveRecord::Migration[5.0]
  def change
    create_table :authorships do |t|
      t.integer :presentation_id
      t.integer :author_id

      t.timestamps
    end
  end
end