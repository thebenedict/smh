RSpec.feature "employer manages employees" do
  scenario "they identify as an employer" do
    employee = create(:employee)
    employer = create(:employer, first_name: "Jane", full_name: "Jane Employerton")
    employer.user.confirm
    login_as(employer.user)

    visit employee_path(employee)
    click_link("I've employed #{employee.common_name}")

    expect(employer.employees).to include(employee)
    expect(page).to have_css("h1", text: "Update employee profile")
  end

  scenario "they view the profile of an employee" do
    employment = create(:employment)
    employment.employer.user.confirm
    login_as(employment.employer.user)

    visit employee_path(employment.employee)
    expect(page).not_to have_css("div.employ")
  end

  scenario "they view their current employees" do
    employment = create(:employment)
    employment.employer.user.confirm
    login_as(employment.employer.user)
    visit root_path

    within "div.top-nav" do
      click_link(employment.employer.first_name)
    end
    expect(page).to have_css("div.employment")    
  end

  scenario "if new user, they see welcome text with next steps" do
    employer = create(:employer, first_name: "Jane", full_name: "Jane Employerton")
    employer.user.confirm
    login_as(employer.user)
    visit root_path

    within "div.top-nav" do
      click_link("Jane")
    end
    expect(page).to have_css("h1", text: "Let's get started")    
  end

  scenario "they update profile details for a current employee from their account page" do
    employment = create(:employment)
    employment.employer.user.confirm
    login_as(employment.employer.user)
    employee = employment.employee
    employee.update(primary_phone: "5551212")

    visit(employer_path(employment.employer))
    within "div.employment" do
      click_link("Update")
    end

    fill_in("Primary phone", with: "4441212")
    check("Employee consent")
    click_on("Update")

    expect(employee.reload.primary_phone).to eq("4441212")
  end

  scenario "they update profile details for a current employee from the employee profile" do
    employment = create(:employment)
    employment.employer.user.confirm
    login_as(employment.employer.user)
    employee = employment.employee
    employee.update(primary_phone: "5551212")

    visit(employee_path(employment.employee))
    click_link("Edit")

    fill_in("Primary phone", with: "4441212")
    check("Employee consent")
    click_on("Update")

    expect(employee.reload.primary_phone).to eq("4441212")
  end

  scenario "they update employment dates" do
    employment = create(:employment)
    employment.employer.user.confirm
    login_as(employment.employer.user)

    visit(employer_path(employment.employer))
    within "div.employment" do
      click_link("Update")
    end
    fill_in("Employer recommendation", with: "Great jorb!")
    check("Employee consent")
    click_on("Update")

    expect(employment.reload.comments).to eq("Great jorb!")
  end
end