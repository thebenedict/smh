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

FactoryGirl.define do
  factory :employment do
    employee
    employer
  end
end
