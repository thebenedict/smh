# == Schema Information
#
# Table name: employers
#
#  id                :integer          not null, primary key
#  first_name        :string
#  full_name         :string
#  organization      :string
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  hosted_avatar_url :string
#

FactoryGirl.define do
  factory :employer do
    first_name "MyString"
    full_name "MyString"
    organization "MyString"
    user
  end
end
