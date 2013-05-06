class PopulateOpeningHours < ActiveRecord::Migration
  def up
    Organization.all.each { |organization| organization.create_opening_hours! }
  end

  def down
    StandardOpeningHour.destroy_all
  end
end
