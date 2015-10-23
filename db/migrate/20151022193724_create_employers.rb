class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :first_name
      t.string :other_names
      t.string :organization
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
