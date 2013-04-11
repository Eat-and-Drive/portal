class Product < ActiveRecord::Base

  has_many :assortments, :dependent => :restrict
  has_many :organizations, :through => :assortments
  
end
