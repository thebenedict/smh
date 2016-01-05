# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :lockable,
         :validatable, :timeoutable

  has_one :employer, inverse_of: :user
  accepts_nested_attributes_for :employer

  before_save { build_employer unless employer }

  def self.find_or_create_from_auth_hash(auth_hash)
    user = User.find_by_email(auth_hash['info']['email'])

    user = User.create_from_auth_hash(auth_hash) unless user.present?
    
    return user
  end

  def self.create_from_auth_hash(auth_hash)
    user = User.new(
      email: auth_hash['info']['email'],
      password: Devise.friendly_token[0,20]
    )
    user.skip_confirmation!
    user.save

    user.employer.update(
      first_name: auth_hash['info']['first_name'],
      full_name: auth_hash['info']['name'],
      hosted_avatar_url: auth_hash['info']['image']
    )

    return user
  end
end
