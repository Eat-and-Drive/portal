class User < ActiveRecord::Base
  attr_accessible :name, :email, :telephone, :address, :zipcode, :city, :password, :password_confirmation
  
  has_secure_password
  
  has_many :employments, :dependent => :destroy
  has_many :organizations, :through => :employments
  has_many :orders, :dependent => :destroy

  validates :name,      :presence => true
  validates :email,     :presence => true, :uniqueness => true
  validates :telephone, :presence => true
  
  def staff?(organization = nil)
    unless superuser?
      unless organization
        employments.present?
      else
        employments.where(:organization_id => organization).present?
      end
    else
      true
    end
  end
  
  def managed_stores
    if superuser?
      Organization.all
    else
      organizations.where(:employments => {:role => 'manager'})
    end
  end

end
