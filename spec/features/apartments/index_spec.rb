require 'rails_helper'

RSpec.describe 'apartments index page', type: :feature do 
  describe 'as a visitor' do 
    before :each do 
      @apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true)
      @apartment_2 = Apartment.create!(apt_name: "Cruze Apartments", has_wd: true, unit_count: 50, city: "Denver", state: "CO", pet_friendly: true)
      @apartment_3 = Apartment.create!(apt_name: "The Walter", has_wd: false, unit_count: 35, city: "Aurora", state: "CO", pet_friendly: false)
    
    end
    describe 'When I visit /apartments' do 
      it 'I see the name of each apartment in the system' do 
        visit '/apartments'
        expect(page).to have_content(@apartment_1.apt_name)
        expect(page).to have_content(@apartment_2.apt_name)
        expect(page).to have_content(@apartment_3.apt_name)
      end
  

      it 'returns records ordered by most recently created first and the dates' do 
        apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true)
        apartment_2 = Apartment.create!(apt_name: "Cruze Apartments", has_wd: true, unit_count: 50, city: "Denver", state: "CO", pet_friendly: true)
        apartment_3 = Apartment.create!(apt_name: "The Walter", has_wd: false, unit_count: 35, city: "Aurora", state: "CO", pet_friendly: false)
        tenant_1 = apartment_1.tenants.create!(tenant_name: "Stevie Nicks", income: 100000, pets: true, occupation: "singer", rent_price: 2500, apartment_id: 1)
        tenant_2 = apartment_1.tenants.create!(tenant_name: "Mick Fleetwood", income: 650000, pets: false, occupation: "drummer", rent_price: 3600, apartment_id: 1)
        tenant_3 = apartment_1.tenants.create!(tenant_name: "John McVie", income: 450000, pets: true, occupation: "guitarist", rent_price: 4000, apartment_id: 1)
        visit '/apartments'
        
        expect("Riverview Apartments").to appear_before("Cruze Apartments")
        expect(page).to have_content(@apartment_1.created_at)
        expect(page).to have_content(@apartment_2.created_at)
        expect(page).to have_content(@apartment_3.created_at)

      end

      it 'A link takes me to a form to fill out to enter a new apartment and its attributes' do 
        visit '/apartments'
        click_on('New Apartment')
        expect(current_path).to eq("/apartments/new")


      end
    end

  end

end