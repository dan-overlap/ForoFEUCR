class AddYoutubeLinkToNews < ActiveRecord::Migration[5.1]
  def change
  	add_column :news, :youtube_link, :string
  end
end
