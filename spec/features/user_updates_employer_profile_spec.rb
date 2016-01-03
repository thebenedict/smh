RSpec.feature "user updates employer profile spec" do
  scenario "they view their profile" do
    employer = create(:employer, first_name: "Jane", full_name: "Jane Employerton", organization: "placeholder")
    employer.user.confirm
    login_as(employer.user)
    visit root_path

    within("div.top-nav") do
      click_link("Jane")
    end

    expect(page).to have_css("h1", text: "Jane Employerton")
  end

  scenario "they update their organization" do
    employer = create(:employer, first_name: "Jane", full_name: "Jane Employerton", organization: "placeholder")
    employer.user.confirm
    login_as(employer.user)
    visit root_path

    within("div.top-nav") do
      click_link("Jane")
    end
    click_on("Edit")
    fill_in("Organization", with: "ACME Ltd")
    click_on("Save")

    expect(employer.reload.organization).to eq("ACME Ltd")
  end
end