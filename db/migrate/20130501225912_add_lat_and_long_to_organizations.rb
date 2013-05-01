class AddLatAndLongToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :lat, :string
    add_column :organizations, :long, :string
  end
end
