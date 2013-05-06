class OpeningHoursController < ApplicationController

  def create
    @organization = Organization.find params[:organization_id]
    @special_opening_hour = SpecialOpeningHour.new params[:opening_hour]
    @special_opening_hour.organization = @organization
    
    if @special_opening_hour.save
      @special_opening_hour = SpecialOpeningHour.new
    else
      render :new
    end
  end

  def edit
    @opening_hour = OpeningHour.find params[:id]
  end
  
  def update
    @opening_hour = OpeningHour.find params[:id]
    
    if @opening_hour.update_attributes params[:opening_hour]
      render :update
    else
      render :edit
    end
  end
  
  def destroy
    @opening_hour = OpeningHour.find params[:id]
    
    if @opening_hour.type == 'SpecialOpeningHour'
      @opening_hour.destroy
    end
  end

end
