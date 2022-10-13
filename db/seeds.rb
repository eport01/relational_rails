# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", 
  has_wd: true, 
  unit_count: 100, 
  city: "Saint Paul", 
  state: "MN", 
  pet_friendly: true
)
apartment_2 = Apartment.create!(apt_name: "Cruze Apartments", 
  has_wd: true, 
  unit_count: 50, 
  city: "Denver", 
  state: "CO", 
  pet_friendly: true
)

apartment_3 = Apartment.create!(apt_name: "The Walter", 
  has_wd: false, 
  unit_count: 35, 
  city: "Aurora", 
  state: "CO", 
  pet_friendly: false
)

tenant_1 = apartment_1.tenants.create!(tenant_name: "Stevie Nicks", income: 100000, pets: true, occupation: "singer", rent_price: 2500, apartment_id: 1)
tenant_2 = apartment_1.tenants.create!(tenant_name: "Mick Fleetwood", income: 650000, pets: false, occupation: "drummer", rent_price: 3600, apartment_id: 1)
tenant_3 = apartment_1.tenants.create!(tenant_name: "John McVie", income: 450000, pets: true, occupation: "guitarist", rent_price: 4000, apartment_id: 1)


