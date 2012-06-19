class AddAttachmentToUploadedImages < ActiveRecord::Migration
  def self.up
    add_attachment :user_uploaded_images, :screenshot
  end

  def self.down
    remove_attachment :user_uploaded_images, :screenshot
  end
end
