require "rails_helper"

RSpec.describe "user signs up" do
  scenario "they view the homepage" do
    visit root_path

    expect(page).to have_title("Staff my House")
  end
end