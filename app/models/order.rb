class Order < ActiveRecord::Base

  belongs_to :organization
  belongs_to :user
  
  has_many :order_lines, :dependent => :destroy
  
end
