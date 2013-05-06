class StandardOpeningHour < OpeningHour

  DAYS = {
    '1' => 'Monday',
    '2' => 'Tuesday',
    '3' => 'Wednesday',
    '4' => 'Thursday',
    '5' => 'Friday',
    '6' => 'Saturday',
    '0' => 'Sunday'
  }
  
  attr_accessible :day
  
  validates :day, :presence => true, :inclusion => DAYS.keys
  
  def self.model_name
    OpeningHour.model_name
  end

end
