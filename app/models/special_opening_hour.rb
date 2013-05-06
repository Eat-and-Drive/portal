class SpecialOpeningHour < OpeningHour

  attr_accessible :date

  validates :date, :uniqueness => { :scope => :organization_id }
  
  def self.model_name
    OpeningHour.model_name
  end

end
