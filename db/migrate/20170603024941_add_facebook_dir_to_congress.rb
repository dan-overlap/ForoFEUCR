class AddFacebookDirToCongress < ActiveRecord::Migration[5.0]
  def change
    add_column :congresses, :facebook_dir, :string
  end
end
