class AddAttachmentColumnsToEmployer < ActiveRecord::Migration
  def change
    add_attachment :employers, :submitted_avatar
  end
end