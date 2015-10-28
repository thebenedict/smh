RSpec.feature "employer manages employees" do
  scenario "they identify as an employer" do
    employee = create(:employee)
    employer = create(:employer, first_name: "Jane", other_names: "Employerton")
    employer.user.update(confirmed_at: Time.now)
    login_as(employer.user)

    visit employee_path(employee)
    click_link("I've employed #{employee.common_name}")

    expect(employer.employees).to include(employee)
    expect(page).to have_css("h1", text: "My staff")
  end

  scenario "they view the profile of an employee" do
    employment = create(:employment)
    employment.employer.user.update(confirmed_at: Time.now)
    login_as(employment.employer.user)

    visit employee_path(employment.employee)
    expect(page).not_to have_css("div.employ")
  end

  scenario "they view their current employees" do
    employment = create(:employment)
    employment.employer.user.update(confirmed_at: Time.now)
    login_as(employment.employer.user)
    visit root_path

    within "div.top-nav" do
      click_link("My staff")
    end
    expect(page).to have_css("div.employment")    
  end

  scenario "they update employment dates" do
    employment = create(:employment)
    employment.employer.user.update(confirmed_at: Time.now)
    login_as(employment.employer.user)

    visit(employments_path)
    within "div.employment" do
      click_link("Update")
    end
    fill_in("Employer recommendation", with: "Great jorb!")
    click_on("Update")

    expect(employment.reload.comments).to eq("Great jorb!")
  end
end