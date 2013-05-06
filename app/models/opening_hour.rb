class OpeningHour < ActiveRecord::Base

  attr_accessible :from, :to

  belongs_to :organization
  
  validates :from, :presence => true
  validates :to,   :presence => true
  
  def closed?
    self.to - self.from < 1.minute
  end
  
end
