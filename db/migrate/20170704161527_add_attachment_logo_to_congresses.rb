class AddAttachmentLogoToCongresses < ActiveRecord::Migration[5.1]
  def self.up
    change_table :congresses do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :congresses, :logo
  end
end
