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
#

class EmployeesController < ApplicationController
  before_action :require_facebook_auth

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    redirect_to current_employer, notice: "Update successful"
  end

  def create
    params['employee']['employments_attributes']['0']['employer_id'] = current_employer.id
    if Employee.create(employee_params)
      flash.notice = "New employee created"
      redirect_to current_employer
    else
      render "new"
    end
  end

  private
    def employee_params
      params.require(:employee).permit(:full_name, :common_name, :avatar,
        :primary_phone, :alternate_phone, :english_proficiency, :roles => [],
        :availability => [], :employments_attributes => [:id, :employer_id, :start_date, :end_date, :comments])
    end
end
