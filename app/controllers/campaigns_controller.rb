class CampaignsController < ApplicationController

  before_filter :find_campaign, :only => [:edit, :update, :destroy]

  def index
    ids = @current_user.managed_stores.collect(&:id)
    @campaigns = Campaign.where(:organization_id => ids)
    @search = @campaigns.search(params[:search])
  end
  
  def new
    @campaign = Campaign.new
  end
  
  def edit; end
  
  def create
    @campaign = Campaign.new params[:campaign]
    
    if @campaign.save
      redirect_to campaigns_path, notice: 'Campaign succesfully created.'
    else
      render :new
    end
  end
  
  def update
  
  end
  
  def destroy
    @campaign.destroy
  end
  
  private
  
    def find_campaign
      @campaign = Campaign.find params[:id]
    end

end
