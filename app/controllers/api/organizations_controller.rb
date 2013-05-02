class Api::OrganizationsController < Api::ApiController

  def index
    @organizations = Organization.all
  
    respond_to do |format|
      format.json { render :json => @organizations }
      format.xml  { render :xml  => @organizations }
    end
  end
  
  def campaigns
    @organization = Organization.find params[:id]
    
    respond_to do |format|
      format.json { render :json => @organization.campaigns }
      format.xml  { render :xml  => @organization.campaigns }
    end
  end

end
