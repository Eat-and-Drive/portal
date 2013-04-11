class Employment < ActiveRecord::Base

  ROLES = {
    'Employee' => 'employee',
    'Manager' => 'manager'
  }

  belongs_to :user
  belongs_to :organization
  
  validates :role, :inclusion => %w(manager employee)
  validates :user_id, :uniqueness => { :scope => :organization_id }
  
end
