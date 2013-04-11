class CreateBaseTables < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.references :user
      t.references :organization
 
      t.string :role
      t.boolean :is_head_contact
      
      t.timestamps
    end
    
    create_table :orders do |t|
      t.references :organization
      t.references :user
      
      t.timestamps
    end
    
    create_table :order_lines do |t|
      t.integer :quantity
      t.decimal :price
      
      t.references :product
    end
    
    create_table :opening_hours do |t|
      t.string :type
      
      t.time :from
      t.time :to
      
      t.string :day
      t.date :date
      
      t.references :organization
    end
  
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :telephone

      t.references :organization
      
      t.timestamps
    end
    
    create_table :products do |t|
      t.string :name
      t.string :container
      t.text :description
      
      t.timestamps
    end
    
    create_table :assortments do |t|
      t.references :product
      t.references :organization
      t.integer :stock
      t.decimal :price
      
      t.timestamps
    end

    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :telephone
      
      t.boolean :superuser

      t.timestamps
    end
  end
end
