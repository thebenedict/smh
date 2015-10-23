require "rails_helper"

RSpec.feature "User searches for employees" do
  scenario "they view the employee index" do
    visit employees_path

    expect(page).to have_title("Employees | Staff my House")
  end

  scenario "they click through to employee show" do
    employee = create(:employee, full_name: "Great Employee")

    visit employees_path
    page.find("#employee_#{employee.id} a").click

    expect(page).to have_css("h1", text: "Great Employee")
  end

  scenario "they see an employees work history" do
    employee = create(:employee)
    employer = create(:employer, first_name: "Jane", other_names: "Employerton")
    employer.employments.create(employee_id: employee.id, start_date: Date.today)
    
    visit employee_path(employee)

    within("div.employment") do
      expect(page).to have_css("div.employer", text: "Jane Employerton")
    end
  end
end