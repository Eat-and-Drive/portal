class Assortment < ActiveRecord::Base

  belongs_to :organization
  belongs_to :product
  
end
