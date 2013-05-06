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
  
  def opening_hours
    @organization = Organization.find params[:id]
    hours = {}
    
    ((Date.current.beginning_of_week)..(Date.current.end_of_week + 1.week)).each do |date|
      o = @organization.special_opening_hours.find_by_date(date)
      o ||= @organization.standard_opening_hours.find_by_day(date.wday)
      hours[date] = "#{l o.from, :format => '%H:%M'} - #{l o.to, :format => '%H:%M'}"
    end
    
    respond_to do |format|
      format.json { render :json => hours }
      format.xml  { render :xml  => hours }
    end
  end

end
