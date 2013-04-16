class Organization < ActiveRecord::Base

  attr_accessible :name, :address, :zipcode, :city, :telephone

  has_many :employments, :dependent => :destroy
  has_many :users, :through => :employments
  has_many :orders, :dependent => :nullify
  has_many :opening_hours, :dependent => :destroy
  has_many :assortments, :dependent => :destroy
  has_many :products, :through => :assortments

  def head_contacts
    users.joins(:employments).where(:employments => {:is_head_contact => true})
  end

end