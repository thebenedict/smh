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
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  employee_consent    :boolean          default(FALSE)
#

class Employee < ActiveRecord::Base
  CHOICES = YAML.load_file("#{Rails.root}/config/data/choices.yml")
  enum english_proficiency: CHOICES["ENGLISH"]

  has_many :employments, inverse_of: :employee
  has_many :employers, through: :employments

  has_attached_file :avatar,
    styles: { medium: "165x165#", thumb: "50x50#" },
    default_url: "no-photo.png"
     
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :employee_consent, inclusion: { in: [true], message: "Employee consent is required" }

  accepts_nested_attributes_for :employments

  LIST_SEPARATOR = " / "

  def roles_list
    roles.join(LIST_SEPARATOR)
  end

  def availability_list
    availability.reject { |a| a.blank? }.join(LIST_SEPARATOR)
  end

  def phone_list
    [primary_phone, alternate_phone].reject { |p| p.blank? }.join(LIST_SEPARATOR)
  end

  def employment_by(employer)
    self.employments.find_or_initialize_by(employer_id: employer.id)
  end

  def english_proficiency_display
    (self.english_proficiency || "Not provided").humanize
  end
end
