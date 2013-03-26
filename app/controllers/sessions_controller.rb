class SessionsController < ApplicationController
  skip_before_filter :authorize

  layout false

  def new; end

  def create
    if user = User.find_by_username(params[:username]).try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, :alert => 'Wrong combination of username/password.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => 'Succesfully logged out.'
  end
end
