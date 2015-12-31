class AddAttachmentToUploadfiles < ActiveRecord::Migration
  def self.up
    remove_column :uploadfiles, :filepath
    add_attachment :uploadfiles, :attachment
  end

  def self.down
    remove_attachment :uploadfiles, :attachment
  end
end
