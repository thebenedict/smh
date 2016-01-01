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

class Employer < ActiveRecord::Base
  has_many :employments, inverse_of: :employer
  has_many :employees, through: :employments

  belongs_to :user, inverse_of: :employer;

  validates :user, presence: true
  validates :first_name, presence: true
  validates :full_name, presence: true

  def avatar_url
    hosted_avatar_url
  end
end
