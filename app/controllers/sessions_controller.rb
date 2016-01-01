class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    sign_in_and_redirect(@user)
  end

  def auth_failure
    render "pages/auth_failure"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end