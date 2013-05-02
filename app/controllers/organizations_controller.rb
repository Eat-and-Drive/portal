class OrganizationsController < ApplicationController

  before_filter :find_organization, :only => [:show, :edit, :update, :destroy]

  before_filter :require_superuser, :except => [:show]
  before_filter(:only => :show) { |c| c.require_staff(@organization) }

  def index
    @search = Organization.search(params[:search])
    @organizations = @search.paginate(:page => params[:page])
  end
  
  def show
  end
  
  def edit
  end
  
  def new
    @organization = Organization.new
  end
  
  def create
    @organization = Organization.new params[:organization]

    if @organization.save
      redirect_to @organization, notice: 'Organization was succesfully created.'
    else
      render :new
    end
  end
  
  def update
    if @organization.update_attributes params[:organization]
      redirect_to @organization, notice: 'Organization was succesfully updated.'
    else
      render :edit
    end
  end
  
  protected
  
    def find_organization
      @organization = Organization.find params[:id]
    end
end
