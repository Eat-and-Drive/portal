class OrganizationsController < ApplicationController

  before_filter :find_organization

  def index
    @search = Organization.search(params[:search])
    @organizations = @search.all
  end
  
  def show
  end
  
  def new
    @organization = Organization.new
  end
  
  protected
  
    def find_organization
      @organization = Organization.find params[:id]
    end
end
