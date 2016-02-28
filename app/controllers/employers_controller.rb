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

class EmployersController < ApplicationController
  before_action :require_facebook_auth

  def show
  end

  def edit
    @employer = current_employer
  end

  def update
    @employer = current_employer
    if @employer.update(employer_params)
      flash.notice = "Your changes were saved"
      redirect_to current_employer
    else
      render "edit"
    end
  end

  private
    def employer_params
      params.require(:employer).permit(:full_name, :first_name, :organization, :submitted_avatar)
    end
end
