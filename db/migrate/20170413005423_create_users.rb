class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :user_id
      t.string :username
      t.string :sede
      t.string :career
      t.binary :avatar
      t.string :gender
      t.string :phone

      t.timestamps
    end
  end
end
