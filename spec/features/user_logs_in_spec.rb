require "rails_helper"

RSpec.feature "User logs in" do
  scenario "they see the log in link" do
    visit root_path

    expect(page).to have_link("Log in", href: new_user_session_path)
  end

  scenario "they log in successfully" do
    create(:user, email: "test@test.com", password: "testing123",
      password_confirmation: "testing123", confirmed_at: DateTime.now)

    visit root_path
    click_on("Log in")
    fill_in("user_email", with: "test@test.com")
    fill_in("user_password", with: "testing123")
    within("form#new_user") do
      click_on("Log in")
    end

    expect(page).to have_css("div.flash-notice", text: "Signed in successfully.")
    expect(page).to have_link("Log out", href: destroy_user_session_path)
  end
end