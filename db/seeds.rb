# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.create(:email => 'cas@example.org', :password => 'cas', :password_confirmation => 'cas', :name => 'Cas Ebbers', :telephone => '06-36180545')
u.superuser = true
u.save

o = Organization.create(:name => 'Texaco Stille Wald', :address => 'Rijksweg A18', :zipcode => '6940 AA', :city => 'Didam', :telephone => '0316-531990')
