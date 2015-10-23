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
    employee_id 1
    employer_id 1
    start_date "2015-10-10"
    end_date "2015-10-10"
    comments "MyText"
  end

end
