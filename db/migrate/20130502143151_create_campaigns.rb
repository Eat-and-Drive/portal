class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :offer
      t.string :status
      t.references :organization

      t.timestamps
    end
  end
end
