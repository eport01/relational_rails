require 'rails_helper'

RSpec.describe 'tenants index page', type: :feature do 
  describe 'as a visitor' do 
    describe 'when i visit /tenants' do 
      it 'I see each tenant in the system including their attributes' do 
        apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", 
          has_wd: true, 
          unit_count: 100, 
          city: "Saint Paul", 
          state: "MN", 
          pet_friendly: true
        )
        tenant_1 = apartment_1.tenants.create!(tenant_name: "Stevie Nicks", income: 100000, pets: true, occupation: "singer", rent_price: 2500, apartment_id: 1)
        visit '/tenants'
        expect(page).to have_content(tenant_1.tenant_name)
      end
      it 'i only see records where the boolean column is true' do 
        apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true)        
        tenant_1 = apartment_1.tenants.create!(tenant_name: "Stevie Nicks", income: 100000, pets: true, occupation: "singer", rent_price: 2500, apartment_id: 1)
        tenant_2 = apartment_1.tenants.create!(tenant_name: "Mick Fleetwood", income: 650000, pets: false, occupation: "drummer", rent_price: 3600, apartment_id: 1)
        tenant_3 = apartment_1.tenants.create!(tenant_name: "John McVie", income: 450000, pets: true, occupation: "guitarist", rent_price: 4000, apartment_id: 1)
        visit '/tenants'
        expect(page).to have_content('Stevie Nicks')
        expect(page).to_not have_content('Mick Fleetwood')  
      end
      
      it 'there is a link to edit the tenants info and it leads me to that tenants edit page' do 
        apartment_1 = Apartment.create!(apt_name: "Riverview Apartments", has_wd: true, unit_count: 100, city: "Saint Paul", state: "MN", pet_friendly: true)        

        tenant_1 = apartment_1.tenants.create!(tenant_name: "Stevie Nicks", income: 100000, pets: true, occupation: "singer", rent_price: 2500, apartment_id: 1)
        visit '/tenants'
        click_on("Edit #{tenant_1.tenant_name}'s Info")
        expect(current_path).to eq("/tenants/#{tenant_1.id}/edit")

      end


    end

  end
end