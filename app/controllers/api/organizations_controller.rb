class Api::OrganizationsController < Api::ApiController

  def index
    @organizations = Organization.all
  
    respond_to do |format|
      format.json { render :json => @organizations }
      format.xml  { render :xml  => @organizations }
    end
  end

end
