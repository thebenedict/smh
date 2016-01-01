class AddProviderProfileImageToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :hosted_avatar_url, :string
  end
end
