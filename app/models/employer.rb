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

class Employer < ActiveRecord::Base
  has_many :employments
  has_many :employees, through: :employments

  def full_name
    [first_name, other_names].compact.join(" ")
  end
end
