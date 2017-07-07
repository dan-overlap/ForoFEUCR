class AddAttachmentFaviconToCongresses < ActiveRecord::Migration[5.1]
  def self.up
    change_table :congresses do |t|
      t.attachment :favicon
    end
  end

  def self.down
    remove_attachment :congresses, :favicon
  end
end
