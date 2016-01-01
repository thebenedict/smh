class RenameEmployerOtherNamesToFullName < ActiveRecord::Migration
  def change
    rename_column :employers, :other_names, :full_name
  end
end
