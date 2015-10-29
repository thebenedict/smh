class EmploymentsController < ApplicationController
  def index
    @employments = current_employer.employments
  end

  def create
    employee = Employee.find(params[:employee_id])
    current_employer.employments.create!(employee_id: employee.id)
    redirect_to employments_path, notice: "You now employ #{employee.common_name}"
  end

  def edit
    @employment = current_employer.employments.find(params[:id])
  end

  def update
    employment = current_employer.employments.find(params[:id])
    employment.update!(employment_params)
    redirect_to employments_path, notice: "Update successful"
  end

  private
    def employment_params
      params.require(:employment).permit(:start_date, :end_date, :comments)
    end
end