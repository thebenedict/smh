# == Schema Information
#
# Table name: employers
#
#  id           :integer          not null, primary key
#  first_name   :string
#  other_names  :string
#  organization :string
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :employer do
    first_name "MyString"
other_names "MyString"
organization "MyString"
user_id 1
  end

end
