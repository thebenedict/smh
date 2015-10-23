class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :common_name
      t.string :primary_phone
      t.string :alternate_phone
      t.text :availability, array: true, default: []
      t.text :roles, array: true, default: []
      t.integer :english_proficiency

      t.timestamps null: false
    end
  end
end
