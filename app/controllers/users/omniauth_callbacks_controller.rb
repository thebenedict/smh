class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_or_create_from_auth_hash(auth_hash)
    if @user.sign_in_count == 0
      flash.notice = "Welcome #{@user.employer.first_name}! Complete your profile below to get started"
    else
      flash.notice = "Welcome #{@user.employer.first_name}, good to see you again!"
    end
    sign_in_and_redirect(@user)
  end

  def failure
    render "pages/auth_failure"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end