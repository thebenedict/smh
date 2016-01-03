# == Schema Information
#
# Table name: employers
#
#  id                            :integer          not null, primary key
#  first_name                    :string
#  full_name                     :string
#  organization                  :string
#  user_id                       :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  hosted_avatar_url             :string
#  submitted_avatar_file_name    :string
#  submitted_avatar_content_type :string
#  submitted_avatar_file_size    :integer
#  submitted_avatar_updated_at   :datetime
#

class Employer < ActiveRecord::Base
  has_many :employments, inverse_of: :employer
  has_many :employees, through: :employments

  belongs_to :user, inverse_of: :employer;

  validates :user, presence: true
  validates :first_name, presence: true
  validates :full_name, presence: true

  has_attached_file :submitted_avatar,
    styles: { medium: "165x165#", thumb: "50x50#" },
    default_url: "no-photo.png"

  validates_attachment_content_type :submitted_avatar, content_type: /\Aimage\/.*\Z/

  def avatar_url(size=:medium)
    if self.submitted_avatar.exists?
      url = self.submitted_avatar.url(size)
    elsif hosted_avatar_url.present?
      url = self.hosted_avatar_url
    else
      url = "no-photo.png"
    end
    return url
  end

  def organization_display
    self.organization.present? ? self.organization : "organization not provided"
  end
end
