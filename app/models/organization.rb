class Organization < ActiveRecord::Base

  attr_accessible :name, :address, :zipcode, :city, :telephone

  has_many :employments, :dependent => :destroy
  has_many :users, :through => :employments
  has_many :orders, :dependent => :nullify
  has_many :opening_hours, :dependent => :destroy
  has_many :standard_opening_hours, :class_name => 'StandardOpeningHour'
  has_many :special_opening_hours, :class_name => 'SpecialOpeningHour', :order => 'date'
  has_many :assortments, :dependent => :destroy
  has_many :products, :through => :assortments
  has_many :campaigns, :dependent => :destroy
  
  after_create :create_opening_hours
  
  has_ancestry

  def head_contacts
    users.where(:employments => {:is_head_contact => true})
  end
  
  def create_opening_hours!
    StandardOpeningHour::DAYS.keys.each do |day|
      opening_hour = StandardOpeningHour.new :from => '00:00', :to => '00:00', :day => day
      self.opening_hours << opening_hour
    end
  end

end
