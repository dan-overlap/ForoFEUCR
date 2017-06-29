class AddAttachmentPdfFileToPresentations < ActiveRecord::Migration[5.1]
  def self.up
    change_table :presentations do |t|
      t.attachment :pdf_file
    end
  end

  def self.down
    remove_attachment :presentations, :pdf_file
  end
end
