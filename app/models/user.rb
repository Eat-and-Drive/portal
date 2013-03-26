class User < ActiveRecord::Base
  attr_accessible :name, :email, :telephone, :password, :password_confirmation, :role
  
  has_secure_password
  
  has_many :employments
  has_many :organizations, :through => :employments
  has_many :orders

  validates :name,     :presence => true
  validates :email,    :presence => true, :uniqueness => true
  validates :telephone, :presence => true
end
