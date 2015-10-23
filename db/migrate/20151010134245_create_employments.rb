class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.integer :employee_id
      t.integer :employer_id
      t.date :start_date
      t.date :end_date
      t.text :comments

      t.timestamps null: false
    end

    add_index :employments, :employee_id
    add_index :employments, :employer_id
  end
end
