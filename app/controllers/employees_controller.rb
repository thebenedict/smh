class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @employee.employments.build
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.employments.first.employer = current_employer
    if @employee.save
      flash.notice = "New employee created"
      redirect_to employments_path
    else
      render "new"
    end
  end

  private
    def employee_params
      params.require(:employee).permit(:full_name, :common_name, :avatar,
        :primary_phone, :alternate_phone, :english_proficiency, :roles => [],
        :availability => [], :employments_attributes => [:start_date, :end_date, :comments])
    end
end