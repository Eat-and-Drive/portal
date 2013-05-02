class Campaign < ActiveRecord::Base

  attr_accessible :name, :offer, :status, :organization_id
  
  belongs_to :organization

end
