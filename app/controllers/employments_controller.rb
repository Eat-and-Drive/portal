class EmploymentsController < ApplicationController

  before_filter :find_organization

  def create  
    @employment              = Employment.new
    @employment.user         = User.find_by_email(params[:email])
    @employment.organization = @organization
    @employment.role         = params[:role]
    @employment.save
  end
  
  def destroy
    @employment = Employment.find params[:id]
    @employment.destroy
  end
  
  def add_head_contact
    @employment = Employment.find params[:id]
    @employment.update_attribute :is_head_contact, true
  end
  
  def remove_head_contact
    @employment = Employment.find params[:id]
    @employment.update_attribute :is_head_contact, false
  end
  
  protected
  
    def find_organization
      @organization = Organization.find params[:organization_id]
    end

end
