require "rails_helper"

RSpec.feature "employer creates an employee profile" do
  scenario "they view the employee form" do
    employer = create(:employer, first_name: "Jane", full_name: "Jane Employerton")
    employer.user.confirm
    login_as(employer.user)

    visit root_path
    click_on "Post a profile"

    expect(page).to have_css("h1", text: "New employee")
  end

  scenario "they view the employee form from their profile page" do
    employer = create(:employer, first_name: "Jane", full_name: "Jane Employerton")
    employer.user.confirm
    login_as(employer.user)

    visit employer_path(employer)
    click_on "New staff profile"

    expect(page).to have_css("h1", text: "New employee")
  end

  scenario "they dont' provide employee consent" do
    employer = create(:employer, first_name: "Jane", full_name: "Jane Employerton")
    employer.user.confirm
    login_as(employer.user)

    visit new_employee_path
    fill_in("Full name", with: "Irini Thompson")
    fill_in("Preferred name", with: "Irini")
    fill_in("Primary phone", with: "0752393969")
    fill_in("Alternate phone", with: "0751121212")
    within(".employee_roles") do
      page.check("Housekeeper")
      page.check("Nanny")
    end
    fill_in("Employer recommendation", with: "Great jorb!")

    expect{ click_button("Save") }.not_to change(Employee, :count)
    expect(page).to have_css("div.flash-alert")
  end

  scenario "they create an employee" do
    employer = create(:employer, first_name: "Jane", full_name: "Jane Employerton")
    employer.user.confirm
    login_as(employer.user)

    visit new_employee_path
    fill_in("Full name", with: "Irini Thompson")
    fill_in("Preferred name", with: "Irini")
    fill_in("Primary phone", with: "0752393969")
    fill_in("Alternate phone", with: "0751121212")
    within(".employee_roles") do
      page.check("Housekeeper")
      page.check("Nanny")
    end
    fill_in("Employer recommendation", with: "Great jorb!")
    check "Employee consent"

    expect{ click_button("Save") }.to change(Employee, :count).by(1)
    expect(page).to have_css("div.employment", text: "Irini Thompson")
  end
end