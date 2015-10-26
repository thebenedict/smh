require "rails_helper"

RSpec.describe "user signs up" do
  scenario "they view the homepage" do
    visit root_path

    expect(page).to have_title("Staff my House")
  end

  scenario "they create an account" do
    visit root_path
    click_link("Sign up")

    fill_in("First name", with: "Joe")
    fill_in("user_employer_attributes_other_names", with: "Testuser")
    fill_in("Organization", with: "U.S. Embassy")
    fill_in("Email", with: "test@user.com")
    fill_in("user_password", with: "mypassword123")
    fill_in("Password confirmation", with: "mypassword123")

    expect{
      within("#new_user") do
        click_button 'Sign up'
      end
    }.to change(Employer, :count).by(1)
    expect(page).to have_css("div.flash-notice", text: "Success! Check your email, we sent you a link to confirm your account.")
    expect(User.last.employer).to eq(Employer.last)
    expect(ActionMailer::Base.deliveries.last["To"].value).to include(User.last.email)
  end
end