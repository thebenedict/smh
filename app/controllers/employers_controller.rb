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
