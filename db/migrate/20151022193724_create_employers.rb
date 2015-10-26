class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :first_name
      t.string :other_names
      t.string :organization
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
