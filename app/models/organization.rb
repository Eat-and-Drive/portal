class Organization < ActiveRecord::Base

  has_many :employments
  has_many :users, :through => :employments
  has_many :orders
  has_many :opening_hours
  has_many :assortments
  has_many :products, :through => :assortments
  
end
