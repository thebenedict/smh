require "rails_helper"

RSpec.describe "employees/index.html.erb" do
  it "renders all employees" do
    assign(:employees, [build(:employee, common_name: "Alice"),
      build(:employee, common_name: "Bob")])

    render
    
    expect(rendered).to have_text('Alice')
    expect(rendered).to have_text('Bob')
  end
end