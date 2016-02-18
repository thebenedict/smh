require "rails_helper"

RSpec.feature "User logs in" do
  scenario "they see the facebook sign in link" do
    visit root_path

    within("a.facebook-button") do
      expect(page).to have_css("span", text: "Sign in with Facebook")
    end
  end

  scenario "they sign in with facebook" do
    visit root_path
    mock_auth_hash

    click_link "sign-in-link"
    expect(page).to have_css("li", text: "Mockfirstname")
    expect(page.find('#current-employer-avatar')['src']).to have_content "mock_user_thumbnail_url"
    expect(page).to have_link("Log out", href: destroy_user_session_path)
  end

  it "facebook auth fails" do
    OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
    visit root_path

    click_link "sign-in-link"
    expect(page).to have_content("Well that didn't work")
  end
end