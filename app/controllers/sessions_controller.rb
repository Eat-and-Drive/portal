class SessionsController < ApplicationController
  skip_before_filter :require_login

  layout false

  def new; end

  def create
    if user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, :alert => 'Wrong combination of e-mail address/password.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => 'Succesfully logged out.'
  end
end
