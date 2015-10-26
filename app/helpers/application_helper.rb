module ApplicationHelper
  def current_employer
    return unless session[:user_id]
    current_user ||= User.find(session[:user_id])
    @current_employer = current_user.employer
  end
end
