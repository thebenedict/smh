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
    redirect_to employments_path, notice: "Update successful"
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.employments.first_or_initialize(employer: current_employer)
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
        :availability => [], :employments_attributes => [:id, :start_date, :end_date, :comments])
    end
end