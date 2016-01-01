class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_employer

  def current_employer
    current_user.employer
  end

  def after_sign_in_path_for(resource)
    employments_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| 
        u.permit({employer_attributes: [:first_name, :full_name, :organization]},
          :email, :password, :password_confirmation)
      }
    end
end