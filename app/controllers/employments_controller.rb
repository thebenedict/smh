class EmploymentsController < ApplicationController
  def create
    employee = Employee.find(params[:employee_id])
    current_employer.employments.find_or_create_by(employee_id: employee.id)
    redirect_to edit_employee_path(employee), notice: "You now employ #{employee.common_name}, please make sure this profile is up to date"
  end

  private
    def employment_params
      params.require(:employment).permit(:start_date, :end_date, :comments)
    end
end
