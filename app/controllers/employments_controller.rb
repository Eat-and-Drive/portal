class EmploymentsController < ApplicationController

  def create
    employment                 = Employment.new
    employment.user            = User.find_by_email(params[:email])
    employment.organization_id = params[:organization_id]
    employment.role            = params[:role]
    employment.save
  end
  
  def destroy
    @employment = Employment.find params[:id]
    @employment.destroy
  end

end
