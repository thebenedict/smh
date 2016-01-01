# == Schema Information
#
# Table name: employees
#
#  id                  :integer          not null, primary key
#  full_name           :string
#  common_name         :string
#  primary_phone       :string
#  alternate_phone     :string
#  availability        :text             default([]), is an Array
#  roles               :text             default([]), is an Array
#  english_proficiency :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Employee < ActiveRecord::Base
  CHOICES = YAML.load_file("#{Rails.root}/config/data/choices.yml")
  enum english_proficiency: [:basic, :good, :excellent]

  has_many :employments, inverse_of: :employee
  has_many :employers, through: :employments

  accepts_nested_attributes_for :employments

  LIST_SEPARATOR = " / "

  def roles_list
    roles.join(LIST_SEPARATOR)
  end

  def availability_list
    availability.join(LIST_SEPARATOR)
  end

  def phone_list
    [primary_phone, alternate_phone].reject { |p| p.blank? }.join(LIST_SEPARATOR)
  end
end
