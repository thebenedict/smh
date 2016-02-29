class AddEmployeeConsentToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :employee_consent, :boolean, default: false
  end
end
