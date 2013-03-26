class Product < ActiveRecord::Base

  has_many :assortments
  has_many :organizations, :through => :assortments
  
end
