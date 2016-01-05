class EmploymentsController < ApplicationController
  def create
    employee = Employee.find(params[:employee_id])
    current_employer.employments.find_or_create_by(employee_id: employee.id)
    redirect_to employer_path(current_employer), notice: "You now employ #{employee.common_name}"
  end

  private
    def employment_params
      params.require(:employment).permit(:start_date, :end_date, :comments)
    end
end
