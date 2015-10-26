# == Schema Information
#
# Table name: employments
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  employer_id :integer
#  start_date  :date
#  end_date    :date
#  comments    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Employment, type: :model do
  it "has its start date set on initialize" do
    employment = build(:employment)
    
    expect(employment.start_date).to eq(Date.today)
  end
end
