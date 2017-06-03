class AddTwitterDirToCongress < ActiveRecord::Migration[5.0]
  def change
    add_column :congresses, :twitter_dir, :string
  end
end
